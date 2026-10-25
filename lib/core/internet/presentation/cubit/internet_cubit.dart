import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:news/core/internet/domain/use%20cases/internet_use_case.dart';
part 'internet_state.dart';

@singleton
class InternetCubit extends Cubit<InternetState> {
  InternetCubit(this.checkInternetUseCase) : super(InternetInitial());

  final CheckInternetUseCase checkInternetUseCase;
  StreamSubscription<bool>? internetSubscription;

  Future<void> startMonitoring() async {
    final isConnected = await checkInternetUseCase.call();
    updateState(isConnected);
    internetSubscription ??=
        checkInternetUseCase.internetStatus.listen(updateState);
  }

  void updateState(bool isConnected) {
    if (isConnected) {
      if (state is! InternetConnected) {
        emit(InternetConnected());
      }
    } else {
      if (state is! InternetDisconnected) {
        emit(InternetDisconnected());
      }
    }
  }

  @override
  Future<void> close() {
    internetSubscription?.cancel();
    return super.close();
  }
}
