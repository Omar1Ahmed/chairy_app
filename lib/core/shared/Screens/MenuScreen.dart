

import 'package:chairy_app/core/Localization/Locales/generated/l10n.dart';
import 'package:chairy_app/core/Localization/locale/logic/locale_cubit.dart';
import 'package:chairy_app/core/Responsive/Models/device_info.dart';
import 'package:chairy_app/core/Responsive/ui_component/info_widget.dart';
import 'package:chairy_app/core/Theme/theming/logic/theming_cubit.dart';
import 'package:chairy_app/core/helper/ImagesNamesHelper/ImagesNamesHelper.dart';
import 'package:chairy_app/core/shared/widgets/CustomAppbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuScreen extends StatefulWidget {

  @override
  _MenuScreenState createState() => _MenuScreenState();

}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return InfoWidget(builder: (context, deviceInfo) {
      return Scaffold(

        appBar: CustomAppbar(deviceInfo: deviceInfo, context: context, showActionsIcons: false, ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(padding: EdgeInsetsDirectional.only(top : deviceInfo.screenHeight * 0.02, start: deviceInfo.screenWidth * 0.06, end: deviceInfo.screenWidth * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: deviceInfo.screenHeight * 0.02,

              children: [

            Text(S.current.Menu, style: Theme.of(context).textTheme.headlineLarge,),
            Text(S.current.Language, style: Theme.of(context).textTheme.bodyMedium,),


            Column(
              children: [

            buildChangeLanguageAndTheme(
                context: context, deviceInfo:  deviceInfo,
                ImageName: ImagesNamesHelper.EgyptIcon,
                title: S.current.Arabic,
                isSelected: BlocProvider.of<LocaleCubit>(context).locale.languageCode == 'ar',
                onTap: () {
                  if(BlocProvider.of<LocaleCubit>(context).locale.languageCode != 'ar') {
                    BlocProvider.of<LocaleCubit>(context).changeLocale('ar');
                  }
                  }
            ),
                Divider(height: deviceInfo.screenHeight * 0.01,),

            buildChangeLanguageAndTheme(
                context: context, deviceInfo:  deviceInfo,
                ImageName: ImagesNamesHelper.USAIcon,
                title: S.current.English,
                isSelected: BlocProvider.of<LocaleCubit>(context).locale.languageCode == 'en',
                onTap: () {
            if(BlocProvider.of<LocaleCubit>(context).locale.languageCode != 'en')
                  BlocProvider.of<LocaleCubit>(context).changeLocale('en');

                }
            ),

              ],
            ),
              ],
            ),
            ),


            Divider(height: deviceInfo.screenHeight * 0.1, thickness: deviceInfo.screenWidth * 0.04, color: Theme.of(context).dividerColor,),

            Padding(padding: EdgeInsetsDirectional.only(start: deviceInfo.screenWidth * 0.06, end: deviceInfo.screenWidth * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: deviceInfo.screenHeight * 0.02,

                children: [
                  Text(S.current.Theme, style: Theme.of(context).textTheme.bodyMedium,),


                  Column(
                    children: [

                      buildChangeLanguageAndTheme(
                          context: context, deviceInfo:  deviceInfo,
                          IconName: Icons.light_mode,
                          title: S.current.lightMode,
                          isSelected: !BlocProvider.of<ThemingCubit>(context).isDark,
                          onTap: () => BlocProvider.of<ThemingCubit>(context).toggleTheme()
                      ),
                      Divider(height: deviceInfo.screenHeight * 0.01,),

                      buildChangeLanguageAndTheme(
                          context: context, deviceInfo:  deviceInfo,
                          IconName: Icons.dark_mode,
                          title: S.current.darkMode,
                          isSelected: BlocProvider.of<ThemingCubit>(context).isDark,
                          onTap: () => BlocProvider.of<ThemingCubit>(context).toggleTheme()
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  InkWell buildChangeLanguageAndTheme(
      {required BuildContext context, required DeviceInfo deviceInfo, required Function()? onTap, String? ImageName, IconData? IconName, required String title, required bool isSelected}) {
    return InkWell(
                onTap: onTap,
                child: SizedBox(
                  height: deviceInfo.screenHeight * 0.07,

                  child: Row(
                      children: [
                        isSelected?
                          Icon(Icons.check, color: Theme.of(context).iconTheme.color, size: deviceInfo.screenWidth * 0.06,):
                            SizedBox(width: deviceInfo.screenWidth * 0.06,),

                        ImageName != null ? Image.asset(ImageName, width: deviceInfo.screenWidth * 0.07,height: deviceInfo.screenHeight * 0.1,
                        ) :
                        Icon(IconName, color: isSelected ? Theme.of(context).iconTheme.color : Colors.grey, size: deviceInfo.screenWidth * 0.06,),

                        SizedBox(width: deviceInfo.screenWidth * 0.03,),

                        Text(title, style: Theme.of(context).textTheme.bodyMedium,),
                      ])
                ),
              );
  }
}