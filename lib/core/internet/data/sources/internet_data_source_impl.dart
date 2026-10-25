import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'internet_data_source.dart';

@LazySingleton(as: InternetDataSource)
class InternetDataSourceImpl implements InternetDataSource {
  final InternetConnection internetConnection;

  InternetDataSourceImpl({
    required this.internetConnection,
  });

  @override
  Stream<bool> get internetStatus {
    return internetConnection.onStatusChange.map(
      (status) => status == InternetStatus.connected,
    );
  }

  @override
  Future<bool> checkInternet() async {
    final status = await internetConnection.internetStatus;
    return status == InternetStatus.connected;
  }
}