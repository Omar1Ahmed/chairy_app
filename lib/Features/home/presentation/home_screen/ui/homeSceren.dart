
  import 'package:chairy_app/Features/cart/presentation/cart_screen/ui/cartScreen.dart';
import 'package:chairy_app/core/Responsive/ui_component/info_widget.dart';
import 'package:chairy_app/core/shared/widgets/BottomNavBar/CustomBottomNavBar.dart';
import 'package:chairy_app/core/shared/widgets/cherryToast/CherryToastMsgs.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';

  import '../../../../../core/Localization/Locales/generated/l10n.dart';
import '../../../../../core/di/di.dart';
  import '../../../../../core/shared/widgets/BottomNavBar/cubit/bottom_nav_bar_cubit.dart';
  import '../../../../../core/shared/widgets/BottomNavBar/cubit/bottom_nav_bar_state.dart';
  import '../../../../cart/presentation/cart_screen/logic/cart_cubit.dart';
import '../../../../categories/presentation/categories/logic/categories_cubit.dart';
  import '../../../../categories/presentation/categories/ui/CategoriesScreen.dart';
  import '../../../../products/presentation/productsScreen/logic/products_cubit.dart';
  import '../../../../products/presentation/productsScreen/ui/products.dart';


  class HomeScreen extends StatefulWidget {

    @override
    State<HomeScreen> createState() => _HomeScreenState();
  }

  class _HomeScreenState extends State<HomeScreen> {
    late final ProductsCubit productsCubit;
    @override
  void initState() {
      productsCubit =getIt<ProductsCubit>();
      print('lol index ');
    super.initState();
  }
    @override
    Widget build(BuildContext context) {
      return BlocConsumer<BottomNavBarCubit, BottomNavBarState>(
          listener: (context,state) async {


            if(context.read<BottomNavBarCubit>().currentIndex == 1){
                productsCubit.getProductsByCategory();

            }else if (context.read<BottomNavBarCubit>().currentIndex == 2){
              context.read<CartCubit>().getTotalQuantityAndPrice();

            }

          },
          builder: (context, state) {
        return Scaffold(

          body: IndexedStack(
            index: context.read<BottomNavBarCubit>().currentIndex,
            children: [

              BlocProvider(create: (_) => getIt<categoriesCubit>()..getCategories(), child: CategoriesScreen()),
              BlocProvider.value(value: productsCubit, child: productsScreen()),
              cartScreen()
            ],
          ),
          bottomNavigationBar: CustomBottomNavBar(),
        );
      });
    }
  }