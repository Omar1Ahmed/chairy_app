import 'package:chairy_app/core/helper/Hive/hiveHelper.dart';

import '../../domain/entity/productEntity.dart';

abstract class ProductsLocalDataSource {

  Future CacheProductsLocally({required List<ProductEntity> products});

  Future<List<ProductEntity>> fetchProductsLocally();
}

class ProductsLocalDataSourceImp implements ProductsLocalDataSource  {
  HiveHelper hiveHelper;

  ProductsLocalDataSourceImp({required this.hiveHelper});

  Future CacheProductsLocally({required List<ProductEntity> products}) async {

  }

  Future<List<ProductEntity>> fetchProductsLocally() async {
    return [];
  }
}