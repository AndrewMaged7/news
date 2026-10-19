import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/cache/cache.dart';
import 'package:news/core/exceptions/exceptions.dart';
import 'package:news/core/exceptions/failures.dart';
import 'package:news/core/exceptions/failures_mapper.dart';
import 'package:news/features/home/data/models/news_model.dart';
import 'package:news/features/home/data/models/sources_model.dart';
import 'package:news/features/home/data/sources/home_data_source.dart';
import 'package:news/features/home/domain/repo/home_repo.dart';


@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  HomeDataSource homeDataSource;
  HomeRepoImpl(this.homeDataSource);
  @override
  Future<Either<Failure, SourcesModel>> getSources(String category) async {
    try {
      final response = await homeDataSource.getSources(category);
      final remoteSourcesModel = SourcesModel.fromJson(response.data);
      await HiveCacheHelper.saveData('sources', remoteSourcesModel.toJson());
      return Right(remoteSourcesModel);
    } on AppException catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, NewsModel>> getNews(String sourceId) async {
    try {
      final response = await homeDataSource.getNews(sourceId);
      final remoteNewsModel = NewsModel.fromJson(response.data);
      await HiveCacheHelper.saveData('news_$sourceId', remoteNewsModel.toJson());
      return Right(remoteNewsModel);
    } on AppException catch (e) {
      return Left(FailureMapper.map(e));
    }
  }
  
}