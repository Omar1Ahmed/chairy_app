import 'package:chairy_app/Features/cart/presentation/cart_screen/logic/cart_cubit.dart';
import 'package:chairy_app/Features/products/presentation/productsScreen/logic/products_cubit.dart';
import 'package:chairy_app/core/Localization/Locales/generated/l10n.dart';
import 'package:chairy_app/core/Responsive/ui_component/info_widget.dart';
import 'package:chairy_app/core/di/di.dart';
import 'package:chairy_app/core/helper/ImagesNamesHelper/ImagesNamesHelper.dart';
import 'package:chairy_app/core/helper/extantions.dart';
import 'package:chairy_app/core/shared/widgets/BottomNavBar/cubit/bottom_nav_bar_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../routing/routs.dart';
import '../cherryToast/CherryToastMsgs.dart';
import 'cubit/bottom_nav_bar_state.dart';

class   CustomBottomNavBar extends StatefulWidget {
  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();

}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return InfoWidget(builder: (context, deviceInfo) {
        return BottomNavigationBar(
          onTap: (index) async {

            if(ProductsCubit.Selectedcategory == null && index == 1){

              await CherryToastMsgs.CherryToastError(info: deviceInfo, context: context, title: S.current.error, description: S.current.selectCategoryFirst);
              return;
            }

            if(index != context.read<BottomNavBarCubit>().currentIndex){

            context.read<BottomNavBarCubit>().changeTab(index);
            }
            },
          items:  [
            BottomNavigationBarItem(
              icon: Image.asset(ImagesNamesHelper.HomeICon,
                width: deviceInfo.screenWidth * 0.06, height: deviceInfo.screenHeight * 0.03,
                color: context.read<BottomNavBarCubit>().currentIndex == 0 ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,

              ),

              label: S.current.home,
            ),
            BottomNavigationBarItem(
              icon: Image.asset(ImagesNamesHelper.CategoriesIcon,  width: deviceInfo.screenWidth * 0.06, height: deviceInfo.screenHeight * 0.03,
                color: context.read<BottomNavBarCubit>().currentIndex == 1 ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
              ),

              label: S.current.categories,
            ),

            BottomNavigationBarItem(
              icon: Badge(
                label: BlocBuilder<CartCubit, CartState>(builder: (context, state) {
                  return Text(context.read<CartCubit>().cartItemsCount.toString(), style: TextStyle(color: Colors.black, fontSize: deviceInfo.screenWidth * 0.025),);
                }),
                alignment: AlignmentDirectional.topEnd,
                backgroundColor: Theme.of(context).primaryColor,
                child: Image.asset(ImagesNamesHelper.CartIcon,  width: deviceInfo.screenWidth * 0.06, height: deviceInfo.screenHeight * 0.03,
                color: context.read<BottomNavBarCubit>().currentIndex == 2 ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
                ),
              ),
              label: S.current.cart,
            ),

          ],
          currentIndex: context.read<BottomNavBarCubit>().currentIndex,

        );

    });
  }
}