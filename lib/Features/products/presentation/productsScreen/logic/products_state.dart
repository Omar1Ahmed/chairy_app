part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class NoSelectedCategory extends ProductsState {}
final class ProductsFetchedSuccessfully extends ProductsState {
  List<ProductEntity> products;
  CategoryEntity CurrentCategory;
  ProductsFetchedSuccessfully({required this.products,required this.CurrentCategory});
}

final class ProductsLoading extends ProductsState {
}
