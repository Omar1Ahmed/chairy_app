part of 'categories_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class CategoriesFetchedSuccessfully extends HomeState {}

final class NoInternetConnection extends HomeState {}

final class HomeCubitError extends HomeState {
  final String errorMessage;

  HomeCubitError({required this.errorMessage});
}

final class CategoriesFetchingLoading extends HomeState {}

