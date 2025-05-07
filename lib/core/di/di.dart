import 'package:chairy_app/Features/authentication/data/data_source/AuthenticaionRemoteDataSource.dart';
import 'package:chairy_app/Features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:chairy_app/Features/place_order/presentation/place_order_screen/logic/place_order_cubit.dart';
import 'package:chairy_app/Features/products/presentation/productsScreen/logic/products_cubit.dart';
import 'package:chairy_app/core/Permission/permission_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../Features/authentication/data/data_source/authentication_remote_data_source.dart';
import '../../Features/authentication/presentation/logic/auth_cubit.dart';
import '../../Features/cart/presentation/cart_screen/logic/cart_cubit.dart';
import '../../Features/categories/data/data_source/categories_local_data_source.dart';
import '../../Features/categories/data/data_source/categories_remote_data_source.dart';
import '../../Features/categories/data/repository/categories_repository_imp.dart';
import '../../Features/categories/domain/repository/categories_repository.dart';
import '../../Features/categories/presentation/categories/logic/categories_cubit.dart';
import '../../Features/place_order/data/data_source/place_order_remote_data_source.dart';
import '../../Features/products/data/data_source/products_local_data_source.dart';
import '../../Features/products/data/data_source/products_remote_data_source.dart';
import '../../Features/products/data/repository/products_repository_imp.dart';
import '../../Features/products/domain/repository/products_repository.dart';
import '../Localization/locale/LanguageInterceptor.dart';
import '../Localization/locale/logic/locale_cubit.dart';
import '../Theme/theming/logic/theming_cubit.dart';
import '../helper/Hive/hiveHelper.dart';
import '../helper/dotenv/dot_env_helper.dart';
import '../network/dio_client.dart';
import '../routing/appRouting.dart';
import '../shared/widgets/BottomNavBar/cubit/bottom_nav_bar_cubit.dart';

final getIt = GetIt.instance;


void configureDependencies() {


  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio(BaseOptions(
      baseUrl: EnvHelper.getString('BASE_URL'),
      headers: {
        'Content-Type': 'application/json',
      },
    ));
    dio.interceptors.add(LanguageInterceptor(getIt<LocaleCubit>()));
    return dio;
  });

  getIt.registerLazySingleton<DioClient>(() => DioClient(getIt<Dio>()));


  getIt.registerLazySingleton<HiveHelper>(() => HiveHelper());

   getIt.registerLazySingleton<CategoriesRepository>(() => CategoriesRepositoryImp(
    categoriesRemoteDataSource: getIt<CategoriesRemoteDataSource>(),
    categoriesLocalDataSource: getIt<CategoriesLocalDataSource>(),
  ));
  getIt.registerLazySingleton<CategoriesRemoteDataSource>(() => CategoriesRemoteDataSourceImp(getIt<DioClient>()));
  getIt.registerLazySingleton<CategoriesLocalDataSource>(() => CategoriesLocalDataSourceImp( hiveHelper: getIt<HiveHelper>()));
  getIt.registerFactory<categoriesCubit>(() => categoriesCubit(categoriesRepository: getIt<CategoriesRepository>()));
//------------------------------------


  // Products Services
  getIt.registerFactory<ProductsCubit>(() => ProductsCubit(productsRepository: getIt<ProductsRepository>(), categoriesRepository: getIt<CategoriesRepository>()));

  getIt.registerLazySingleton<ProductsRepository>(() => ProductsRepositoryImp(
    productsRemoteDataSource: getIt<ProductsRemoteDataSource>(),
    productsLocalDataSource: getIt<ProductsLocalDataSource>(),
  ));

  getIt.registerLazySingleton<ProductsRemoteDataSource>(() => ProductsRemoteDataSourceImp(dioClient: getIt<DioClient>()));
  getIt.registerLazySingleton<ProductsLocalDataSource>(() => ProductsLocalDataSourceImp(hiveHelper: getIt<HiveHelper>()));

  // -------------------------


  // Auth Services

  getIt.registerFactory<AuthCubit>(
        () => AuthCubit(getIt<AuthenticationRemoteDataSource>()),
  );

  getIt.registerLazySingleton<AuthenticationRemoteDataSource>(() => AuthenticationRemoteDataSourceImp(dioClient: getIt<DioClient>()));

  // -----------------------


  //PLaceOrder Services
  getIt.registerFactory<PlaceOrderCubit>(
        () => PlaceOrderCubit(placeOrderRemoteDataSource: getIt<PlaceOrderRemoteDataSource>()),
  );

  getIt.registerLazySingleton<PlaceOrderRemoteDataSource>(() => PlaceOrderRemoteDataSourceImp(dioClient: getIt<DioClient>()));



  //Cart Services
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt<CartRemoteDataSource>()));
  getIt.registerLazySingleton<CartRemoteDataSource>(() => CartRemoteDataSourceImp(dioClient: getIt<DioClient>()));
  //-----------------------
  getIt.registerLazySingleton<ThemingCubit>(() => ThemingCubit(hiveHelper: getIt<HiveHelper>()));
  getIt.registerLazySingleton<LocaleCubit>(() => LocaleCubit(hiveHelper: getIt<HiveHelper>()));
  getIt.registerLazySingleton<AppRouts>(() => AppRouts());
  getIt.registerLazySingleton<BottomNavBarCubit>(() => BottomNavBarCubit());
  getIt.registerLazySingleton(() => PermissionCubit());

}
