
import 'package:chairy_app/Features/authentication/presentation/logic/auth_cubit.dart';
import 'package:chairy_app/Features/cart/domain/entity/cartItemEntity.dart';
import 'package:chairy_app/Features/home/presentation/home_screen/ui/homeSceren.dart';
import 'package:chairy_app/Features/products/presentation/productsScreen/ui/productDetails.dart';
import 'package:chairy_app/core/Permission/permission_cubit.dart';
import 'package:chairy_app/core/di/di.dart';
import 'package:chairy_app/core/routing/routs.dart';
import 'package:chairy_app/core/shared/Screens/MenuScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Features/categories/presentation/categories/logic/categories_cubit.dart';
import '../../Features/categories/presentation/categories/ui/CategoriesScreen.dart';
import '../../Features/place_order/presentation/place_order_screen/logic/place_order_cubit.dart';
import '../../Features/place_order/presentation/place_order_screen/ui/placeOrderScreen.dart';
import '../../Features/products/domain/entity/productEntity.dart';
import '../../Features/products/presentation/productsScreen/logic/products_cubit.dart';
import '../../Features/products/presentation/productsScreen/ui/products.dart';
import '../../Features/splash_screen/presentation/ui/splash_screen.dart';


class AppRouts {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case Routes.HomePageScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case Routes.CategoriesScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(create: (_) => getIt<categoriesCubit>()..getCategories(), child: CategoriesScreen()));

        case Routes.ProductsScreen:
          final categoryId = settings.arguments as String?;
          print('Routing $categoryId');
        return MaterialPageRoute(
            builder: (context) => BlocProvider(create: (_) => getIt<ProductsCubit>(), child: productsScreen()));

       case Routes.ProductDetailsScreen:
          final Product = settings.arguments as ProductEntity;
          print('Routing $Product');
        return MaterialPageRoute(
            builder: (context) => BlocProvider(create: (_) => getIt<PermissionCubit>(), child: productDetails(product: Product)));

        case Routes.PlaceOrderScreen:
        return MaterialPageRoute(
            builder: (context) =>MultiBlocProvider(providers: [
              BlocProvider(create: (_) => getIt<PlaceOrderCubit>(),),
              BlocProvider(create: (_) => getIt<AuthCubit>(),),

            ], child: PlaceOrderScreen()));

      case Routes.MenuScreen:
        return MaterialPageRoute(
            builder: (context) => MenuScreen());
      default:
        return null;
    }

    }
}

