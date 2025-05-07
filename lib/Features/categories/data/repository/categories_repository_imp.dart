
import '../../../../core/network/Connectivity/connectivity_helper.dart';
import '../../domain/entity/CategoryEntity.dart';
import '../../domain/repository/categories_repository.dart';
import '../data_source/categories_local_data_source.dart';
import '../data_source/categories_remote_data_source.dart';

class CategoriesRepositoryImp implements CategoriesRepository  {

  CategoriesRemoteDataSource categoriesRemoteDataSource;
  CategoriesLocalDataSource categoriesLocalDataSource;

  CategoriesRepositoryImp({required this.categoriesRemoteDataSource, required this.categoriesLocalDataSource});

  @override
  Future<List<CategoryEntity>> getCategories() async {
    final isConnected = await ConnectivityHelper.isConnected();
    late List<CategoryEntity> response;

    if(isConnected){

        response = await categoriesRemoteDataSource.fetchCategoriesFromApi();
        await categoriesLocalDataSource.CacheCategoriesLocally(response);


    }else{

      response = await categoriesLocalDataSource.fetchCategoriesLocally();
    }

    return response;
  }
}