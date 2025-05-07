part of 'place_order_cubit.dart';

@immutable
sealed class PlaceOrderState {}

final class PlaceOrderInitial extends PlaceOrderState {}
final class PlaceOrderChangeIndicatorStep extends PlaceOrderState {}

final class PlaceOrderLoadingState extends PlaceOrderState {}
final class PlaceOrderSuccessState extends PlaceOrderState {}
final class PlaceOrderErrorState extends PlaceOrderState {
  final String message;

  PlaceOrderErrorState({required this.message});
}
