import 'package:bloc/bloc.dart';
import 'package:chairy_app/Features/categories/domain/repository/categories_repository.dart';
import 'package:chairy_app/Features/products/domain/entity/productEntity.dart';
import 'package:chairy_app/Features/products/domain/repository/products_repository.dart';
import 'package:meta/meta.dart';

import '../../../../categories/domain/entity/CategoryEntity.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  static CategoryEntity? Selectedcategory;
  ProductsRepository productsRepository;
  CategoriesRepository categoriesRepository;

  ProductsCubit({required this.productsRepository,required this.categoriesRepository}) : super(ProductsInitial());

  List<CategoryEntity> Categories = [];
  List<ProductEntity> Products = [];

  getProductsByCategory() async {
    emit(ProductsLoading());
    String? categoryId = Selectedcategory?.id.toString();

      print('getProductsByCategory $categoryId');
    if(categoryId != null){
      print('Fetching products by category');

      Products = await productsRepository.getProducts(categoryId: categoryId);


      print('before emit $Products ${Selectedcategory?.image}');
      emit(ProductsFetchedSuccessfully(CurrentCategory: Selectedcategory!,products: Products));

    }else{
      print('No selected category');
    final fetchedCategories = await categoriesRepository.getCategories();
    Categories = fetchedCategories;
    print('Categories: $Categories');
      emit(NoSelectedCategory());
    }
  }

}
