import 'package:chairy_app/Features/home/presentation/home_screen/ui/homeSceren.dart';
import 'package:chairy_app/core/Responsive/ui_component/info_widget.dart';
import 'package:chairy_app/core/di/di.dart';
import 'package:chairy_app/core/helper/ImagesNamesHelper/ImagesNamesHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../categories/presentation/categories/logic/categories_cubit.dart';
import '../../../categories/presentation/categories/ui/CategoriesScreen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), ()  {


      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            // return BlocProvider(create: (_) => getIt<categoriesCubit>()..getCategories(), child: CategoriesScreen());
            return HomeScreen();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation, // Fade animation
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 1000), // Adjust the duration
        ),
      );
    });

    return InfoWidget(builder: (context, deviceInfo) {
      return Scaffold(
        body: Container(
          child: Image.asset(
            ImagesNamesHelper.SplashLogo,
            width: deviceInfo.screenWidth  ,
            height: deviceInfo.screenHeight ,
          ),
        ),
      );
    });
  }
}
