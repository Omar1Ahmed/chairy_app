import 'dart:io';

import 'package:chairy_app/core/Localization/Locales/generated/l10n.dart';
import 'package:chairy_app/core/Localization/locale/logic/locale_cubit.dart';
import 'package:chairy_app/core/Theme/AppTheme.dart';
import 'package:chairy_app/core/Theme/theming/logic/theming_cubit.dart';
import 'package:chairy_app/core/di/di.dart';
import 'package:chairy_app/core/helper/Hive/hiveHelper.dart';
import 'package:chairy_app/core/routing/appRouting.dart';
import 'package:chairy_app/core/shared/widgets/BottomNavBar/cubit/bottom_nav_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Features/cart/presentation/cart_screen/logic/cart_cubit.dart';
import 'core/routing/routs.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  configureDependencies();
  await getIt<HiveHelper>().init();


  runApp(
      MultiBlocProvider(

          providers: [
            BlocProvider(create: (_) => getIt<LocaleCubit>()..loadLocale()),

            BlocProvider(create: (_) => getIt<ThemingCubit>()..loadTheme()),

            BlocProvider(create: (_) => getIt<BottomNavBarCubit>()),

            BlocProvider(create: (_) => getIt<CartCubit>(),)
          ],
          child: MyApp(
              appRouter: AppRouts()
          )));
}

class MyApp extends StatelessWidget {
  final AppRouts appRouter;
  const MyApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemingCubit, ThemingState>(builder: (context, Themeingstate) {
      if(Themeingstate is ThemeLoaded) {
        return BlocBuilder<LocaleCubit, LocaleState>(builder: (context, Localestate) {

          if(Localestate is LocaleLoaded){
            return MaterialApp(
              title: 'Flutter Demo',
              locale: context.read<LocaleCubit>().locale,

              localizationsDelegates: [
                S.delegate, // Ensure this is added
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              theme: context.read<ThemingCubit>().isDark ? AppThemes.darkTheme : AppThemes.lightTheme,

              initialRoute: Routes.splashScreen,
              onGenerateRoute: appRouter.generateRoute,

            );
          }else{
            return Container();
          }
        });

      }else{
        return Container();
      }
    });
  }
}


