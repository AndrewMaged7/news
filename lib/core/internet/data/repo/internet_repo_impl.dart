
import 'package:injectable/injectable.dart';
import 'package:news/core/internet/data/sources/internet_data_source.dart';
import 'package:news/core/internet/domain/repo/internet_repo.dart';

@LazySingleton(as: InternetRepository)
class InternetRepositoryImpl implements InternetRepository {
  final InternetDataSource internetDataSource;

  InternetRepositoryImpl({
    required this.internetDataSource,
  });

  @override
  Stream<bool> get internetStatus {
    return internetDataSource.internetStatus;
  }

  @override
  Future<bool> checkInternet() {
    return internetDataSource.checkInternet();
  }
}