abstract class InternetRepository {
  Stream<bool> get internetStatus;

  Future<bool> checkInternet();
}