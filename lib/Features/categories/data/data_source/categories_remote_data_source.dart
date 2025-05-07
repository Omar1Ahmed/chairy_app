import 'package:chairy_app/core/network/dio_client.dart';

import '../../domain/entity/CategoryEntity.dart';
import '../model/Categories.dart';


 abstract class CategoriesRemoteDataSource {

  Future<List<CategoryEntity>> fetchCategoriesFromApi();
}




class CategoriesRemoteDataSourceImp implements CategoriesRemoteDataSource  {
  DioClient dioClient;

  CategoriesRemoteDataSourceImp(this.dioClient);

  @override
  Future<List<CategoryEntity>> fetchCategoriesFromApi() async {

    try {
      final response = await dioClient.get("/api/category/get", header: {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer ${userMainDetails.state.token ?? token}',
      },
      );
      print('Categories $response');

      return CategoriesModel.fromJson(response).toEntities();
    } catch (e) {
      throw Exception("Error fetching posts: ${e.toString()}");
    }
  }

}