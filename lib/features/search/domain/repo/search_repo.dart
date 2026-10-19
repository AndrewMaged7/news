import 'package:dartz/dartz.dart';
import 'package:news/core/exceptions/failures.dart';
import 'package:news/features/search/data/models/search_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, SearchModel>> search(String query);
}