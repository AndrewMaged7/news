import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:news/features/search/data/models/search_model.dart';
import 'package:news/features/search/domain/use_cases/search_use_case.dart';
part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {

  TextEditingController searchController = TextEditingController();
  GlobalKey<FormState> searchFormKey = GlobalKey<FormState>();


  SearchModel? searchModel;

  SearchUseCase searchUseCase;
  SearchCubit({required this.searchUseCase}) : super(SearchInitial());

  Future<void> search(String query) async {
    emit(SearchLoading());
    final result = await searchUseCase.call(query);
    result.fold(
      (failure) => emit(SearchError(failure.message)),
      (searchModel) {
        if (searchModel.articles?.isEmpty ?? false) {
          emit(SearchEmpty());
          return;
        }
        this.searchModel = searchModel;
        emit(SearchSuccess());
      },
    );
  }
}
