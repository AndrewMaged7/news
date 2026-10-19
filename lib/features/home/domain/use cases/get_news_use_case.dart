import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/exceptions/failures.dart';
import 'package:news/features/home/data/models/news_model.dart';
import 'package:news/features/home/domain/repo/home_repo.dart';

@injectable
class GetNewsUseCase {
  HomeRepo homeRepo;
  GetNewsUseCase(this.homeRepo);
  Future<Either<Failure, NewsModel>> call(String sourceId) async {
    return await homeRepo.getNews(sourceId);
  }
}