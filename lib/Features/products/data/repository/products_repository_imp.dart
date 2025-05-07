import 'package:chairy_app/Features/products/data/data_source/products_local_data_source.dart';
import 'package:chairy_app/Features/products/data/data_source/products_remote_data_source.dart';
import 'package:chairy_app/Features/products/data/model/ProductsModel.dart';
import 'package:chairy_app/Features/products/domain/entity/productEntity.dart';
import 'package:chairy_app/Features/products/domain/repository/products_repository.dart';

import '../../../../core/network/Connectivity/connectivity_helper.dart';

class ProductsRepositoryImp implements ProductsRepository  {
  ProductsRemoteDataSource productsRemoteDataSource;
  ProductsLocalDataSource productsLocalDataSource;

  ProductsRepositoryImp({required this.productsRemoteDataSource,required this.productsLocalDataSource});

  @override
  Future<List<ProductEntity>> getProducts({required String categoryId}) async {
    final isConnected = await ConnectivityHelper.isConnected();


    if(isConnected){

      final response = await productsRemoteDataSource.fetchProductsFromApi(categoryId: categoryId);

      final ProductsEntities = response.toEntities();
      await productsLocalDataSource.CacheProductsLocally(products: ProductsEntities);
        return ProductsEntities;
    }else{

      final response = await productsLocalDataSource.fetchProductsLocally();

    }
    return [];
  }
}