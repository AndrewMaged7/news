import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/exceptions/failures.dart';
import 'package:news/features/home/data/models/sources_model.dart';
import 'package:news/features/home/domain/repo/home_repo.dart';

@injectable
class GetSourcesUseCase {
  HomeRepo homeRepo;
  GetSourcesUseCase(this.homeRepo);

  Future<Either<Failure, SourcesModel>> call(String category) async {
    return await homeRepo.getSources(category);
  }
}