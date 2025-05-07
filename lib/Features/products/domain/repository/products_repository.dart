import 'package:chairy_app/Features/products/domain/entity/productEntity.dart';

abstract class ProductsRepository {

  Future<List<ProductEntity>> getProducts({required String categoryId});
}