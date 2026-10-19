import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/exceptions/failures.dart';
import 'package:news/features/search/data/models/search_model.dart';
import 'package:news/features/search/domain/repo/search_repo.dart';

@injectable
class SearchUseCase {
  final SearchRepo searchRepo;

  SearchUseCase(this.searchRepo);

  Future<Either<Failure, SearchModel>> call(String query) async {
    return await searchRepo.search(query);
  }
}