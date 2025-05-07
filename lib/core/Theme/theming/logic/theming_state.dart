part of 'theming_cubit.dart';

@immutable
sealed class ThemingState {}

final class ThemingInitial extends ThemingState {}

class ThemeLoaded extends ThemingState {
  ThemeLoaded();
}