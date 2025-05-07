import 'package:chairy_app/Features/products/data/model/ProductsModel.dart';
import 'package:chairy_app/Features/products/domain/entity/productEntity.dart';
import 'package:chairy_app/core/network/dio_client.dart';

abstract class ProductsRemoteDataSource {

  Future<ProductsModel> fetchProductsFromApi({required String categoryId});
}

class ProductsRemoteDataSourceImp implements ProductsRemoteDataSource  {
  DioClient dioClient;

  ProductsRemoteDataSourceImp({required this.dioClient});

  Future<ProductsModel> fetchProductsFromApi({required String categoryId}) async {

    print('/api/product/category?category_id=$categoryId');
    try {
      final response = await dioClient.get("/api/product/category?category_id=$categoryId", header: {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer ${userMainDetails.state.token ?? token}',
      },
      );

      print(response);
      return ProductsModel.fromJson(response);
    } catch (e,t) {
      print(e);
      print(t);

      throw Exception("Error fetching posts: ${e.toString()}");
    }

  }
}