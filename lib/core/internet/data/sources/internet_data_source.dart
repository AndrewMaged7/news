abstract class InternetDataSource {
  Stream<bool> get internetStatus;

  Future<bool> checkInternet();
}