
import '../entity/CategoryEntity.dart';

abstract class CategoriesRepository {

  Future<List<CategoryEntity>> getCategories();
}