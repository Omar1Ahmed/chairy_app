import 'package:chairy_app/Features/products/domain/entity/productEntity.dart';

class CartItemEntity {
  final ProductEntity product;
  int quantity;

  CartItemEntity({required this.product, this.quantity = 1});
}
