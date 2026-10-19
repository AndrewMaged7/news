part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetSourcesLoading extends HomeState {}
final class GetSourcesSuccess extends HomeState {}
final class GetSourcesError extends HomeState {
  final String message;
  GetSourcesError(this.message);
}

final class GetNewsLoading extends HomeState {}
final class GetNewsSuccess extends HomeState {}
final class GetNewsError extends HomeState {
  final String message;
  GetNewsError(this.message);
}
