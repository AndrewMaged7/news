import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:news/features/home/data/models/news_model.dart';
import 'package:news/features/home/data/models/sources_model.dart';
import 'package:news/features/home/domain/use%20cases/get_news_use_case.dart';
import 'package:news/features/home/domain/use%20cases/get_sources_use_case.dart';
part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  SourcesModel? sourcesModel;
  NewsModel? newsModel;
  

  GetSourcesUseCase getSourcesUseCase;
  GetNewsUseCase getNewsUseCase;
  HomeCubit(this.getSourcesUseCase, this.getNewsUseCase) : super(HomeInitial());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int tabIndex = 0;
  String category = '';

  
Future<void> getSources(String category) async {
  final result = await getSourcesUseCase.call(category);
  await result.fold(
    (failure) async {
      emit(GetSourcesError(failure.message));
    },
    (SourcesModel sourcesModel) async {
      this.sourcesModel = sourcesModel;
      final sources = sourcesModel.sources;
      if (sources == null || sources.isEmpty) {
        emit(GetSourcesSuccess());
        return;
      }
      tabIndex = 0;
      emit(GetSourcesSuccess());
      final firstSourceId = sources.first.id;
      if (firstSourceId != null && firstSourceId.isNotEmpty) {
        await getNews(sourceId: firstSourceId);
      }
    },
  );
}


  Future<void> getNews({required String sourceId}) async {
    emit(GetNewsLoading());
    final result = await getNewsUseCase.call(sourceId);
    result.fold((failure) {
      emit(GetNewsError(failure.message));
    }, (NewsModel newsModel) {
      this.newsModel = newsModel;
      emit(GetNewsSuccess());
    });
  }



  Future<void> chooseSource(int index) async {
    tabIndex = index;

    await getNews(
      sourceId: sourcesModel!.sources![index].id.toString(),
    );
  }
}
