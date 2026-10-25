
import 'package:injectable/injectable.dart';
import 'package:news/core/internet/domain/repo/internet_repo.dart';


@lazySingleton
class CheckInternetUseCase {
  final InternetRepository internetRepository;

  CheckInternetUseCase({
    required this.internetRepository,
  });

  Stream<bool> get internetStatus {
    return internetRepository.internetStatus;
  }

  Future<bool> call() {
    return internetRepository.checkInternet();
  }
}