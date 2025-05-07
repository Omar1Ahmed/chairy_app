import 'package:chairy_app/core/Responsive/Models/device_info.dart';
import 'package:chairy_app/core/helper/ImagesNamesHelper/ImagesNamesHelper.dart';
import 'package:chairy_app/core/helper/extantions.dart';
import 'package:chairy_app/core/shared/widgets/BottomNavBar/cubit/bottom_nav_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Localization/Locales/generated/l10n.dart';
import '../../Notifications/Notifications.dart';
import '../../routing/routs.dart';



AppBar CustomAppbar({required DeviceInfo deviceInfo, required BuildContext context, bool isInHome = false, bool showActionsIcons = true}) {

  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leadingWidth: showActionsIcons ? deviceInfo.screenWidth*0.15 : deviceInfo.screenWidth*0.95,
    leading: showActionsIcons ?
    InkWell(
      onTap: (){
        if(!isInHome){

          context.read<BottomNavBarCubit>().changeTab(0);
          context.pushNamedAndRemoveUntil(Routes.HomePageScreen, predicate: (route) => false);
          // Navigator.popUntil(context, ModalRoute.withName(Routes.ca),);
        }
      },
      child: Image.asset(
        ImagesNamesHelper.SplashLogo,
        width: deviceInfo.screenWidth * 0.1,
        height: deviceInfo.screenHeight * 0.1,
        alignment: Alignment.centerLeft,
      ),
    ) : Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){

              context.pushNamedAndRemoveUntil(Routes.HomePageScreen, predicate: (route) => false);

            }, icon: Icon(Icons.arrow_back_ios_new),iconSize: deviceInfo.screenWidth * 0.08,color: Colors.red,),
            InkWell(
              onTap: (){
                if(!isInHome){

                  context.read<BottomNavBarCubit>().changeTab(0);
                  context.pushNamedAndRemoveUntil(Routes.HomePageScreen, predicate: (route) => false);
                }
              },
              child: Image.asset(
                ImagesNamesHelper.SplashLogo,
                width: deviceInfo.screenWidth * 0.1,
                height: deviceInfo.screenHeight * 0.1,
                alignment: Alignment.centerLeft,
              ),
            )
          ]
      ),

    actions: showActionsIcons ? [

      InkWell(
        onTap: () async {

        },
        child: Image.asset(
          ImagesNamesHelper.SearchIcon,
          width: deviceInfo.screenWidth * 0.1,
          alignment: Alignment.center,
        ),
      ),

      SizedBox(width: deviceInfo.screenWidth * 0.03,),
      InkWell(
        onTap: (){

          context.pushNamed(Routes.MenuScreen);
        },
        child: Image.asset(
        ImagesNamesHelper.MenuIcon,
        width: deviceInfo.screenWidth * 0.1,
        alignment: Alignment.center,
      ),
      )
    ] : null,
    actionsPadding: EdgeInsetsDirectional.only(end: deviceInfo.screenWidth * 0.05),



  );
}