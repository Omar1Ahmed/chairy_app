part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class AddedToCartSuccessfully extends CartState {}
final class ProductsListAddedToCartSuccessfully extends CartState {}

final class QuantityUpdated extends CartState {}

final class CartItemDeletedSuccessfully extends CartState {}

final class CartItemError extends CartState {
  final String message;

  CartItemError({required this.message});
}

final class NoInternetConnection extends CartState {}



