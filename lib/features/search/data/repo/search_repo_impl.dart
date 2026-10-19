import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/exceptions/exceptions.dart';
import 'package:news/core/exceptions/failures.dart';
import 'package:news/core/exceptions/failures_mapper.dart';
import 'package:news/features/search/data/models/search_model.dart';
import 'package:news/features/search/data/sources/search_data_source.dart';
import 'package:news/features/search/domain/repo/search_repo.dart';


@Injectable(as: SearchRepo)
class SearchRepoImpl implements SearchRepo {
  final SearchDataSource searchDataSource;

  SearchRepoImpl({required this.searchDataSource});

  @override
  Future<Either<Failure, SearchModel>> search(String query) async {
    try {
      final response = await searchDataSource.getSearchNews(query);
      final searchModel = SearchModel.fromJson(response.data);
      return Right(searchModel);
    } on AppException catch (e) {
      return Left(FailureMapper.map(e));
    }
  }
}