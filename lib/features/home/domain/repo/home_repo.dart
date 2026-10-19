import 'package:dartz/dartz.dart';
import 'package:news/core/exceptions/failures.dart';
import 'package:news/features/home/data/models/news_model.dart';
import 'package:news/features/home/data/models/sources_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, SourcesModel>> getSources(String category);
  Future<Either<Failure, NewsModel>> getNews(String sourceId);
}