
import 'package:chairy_app/core/helper/Hive/adapters/category_hive_model.dart';
import 'package:chairy_app/core/helper/Hive/hiveBoxes.dart';
import 'package:chairy_app/core/helper/Hive/hiveHelper.dart';

import '../../domain/entity/CategoryEntity.dart';

abstract class CategoriesLocalDataSource {

  Future<List<CategoryEntity>> fetchCategoriesLocally();

  Future<void> CacheCategoriesLocally(List<CategoryEntity> Categories);

}

class CategoriesLocalDataSourceImp implements CategoriesLocalDataSource  {
  HiveHelper hiveHelper;

  CategoriesLocalDataSourceImp({required this.hiveHelper});

  @override
  Future<void> CacheCategoriesLocally(List<CategoryEntity> Categories) {

    final hiveModels = Categories.map((e) => CategoryHiveModel.fromEntity(e)).toList();



    return hiveHelper.put<List<CategoryHiveModel>>(
      HiveBoxes.categories.box,
      HiveBoxes.categories.categoriesKey,
      hiveModels,
    );

  }

  @override
  Future<List<CategoryEntity>> fetchCategoriesLocally() async {
    final  data = await hiveHelper.get(
      HiveBoxes.categories.box,
      HiveBoxes.categories.categoriesKey,
    );

    if (data == null || data.isEmpty) {
      return [];
    }


    final hiveModels = (data as List).cast<CategoryHiveModel>();

    return hiveModels.map((e) => e.toEntity()).toList();
  }

}