part of 'internet_cubit.dart';

@immutable
sealed class InternetState {}

class InternetInitial extends InternetState {}

class InternetConnected extends InternetState {}

class InternetDisconnected extends InternetState {}
