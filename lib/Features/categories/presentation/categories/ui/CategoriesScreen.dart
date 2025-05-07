import 'dart:math';
import 'package:chairy_app/Features/products/presentation/productsScreen/logic/products_cubit.dart';
import 'package:chairy_app/core/Localization/Locales/generated/l10n.dart';
import 'package:chairy_app/core/Responsive/ui_component/info_widget.dart';
import 'package:chairy_app/core/helper/ImagesNamesHelper/ImagesNamesHelper.dart';
import 'package:chairy_app/core/helper/dotenv/dot_env_helper.dart';
import 'package:chairy_app/core/shared/widgets/BottomNavBar/CustomBottomNavBar.dart';
import 'package:chairy_app/core/shared/widgets/BottomNavBar/cubit/bottom_nav_bar_cubit.dart';
import 'package:chairy_app/core/shared/widgets/CustomAppbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/categories_cubit.dart';
import 'widgets/categoryCard.dart';

class CategoriesScreen extends StatefulWidget {

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();

}


class _CategoriesScreenState extends State<CategoriesScreen> {

  late String BaseUrl ;
  @override
  void initState() {
    BaseUrl = EnvHelper.getString('BASE_URL');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return InfoWidget(builder: (context, deviceInfo) {

      return BlocBuilder<categoriesCubit, HomeState>(builder: (context, state) {
        print('Homeee $state');
        return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: CustomAppbar(
              deviceInfo: deviceInfo,
              context: context,
              isInHome: true
          ),
          extendBodyBehindAppBar: true,

          body:SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    SizedBox(
                      width: deviceInfo.screenWidth,
                      height: deviceInfo.screenHeight,
                      child: Image.asset(
                        ImagesNamesHelper.HomeImage,
                        fit: BoxFit.cover,

                      ),
                    ),

                    Padding(
                        padding: EdgeInsetsDirectional.only(top: deviceInfo.screenHeight * 0.21,end: deviceInfo.screenWidth * 0.09,start: deviceInfo.screenWidth * 0.09),
                        child: Column(

                          spacing:  deviceInfo.screenHeight * 0.01,
                          children: [

                            Text(
                              S.current.HomeHeadline,
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900,fontSize: deviceInfo.screenWidth * 0.1,letterSpacing: -1,),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              S.current.HomeHeadline2,
                              style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w900,fontSize: deviceInfo.screenWidth * 0.045,letterSpacing: 0, ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        )

                    ),

                  ],
                ),


                Container(
                  width: deviceInfo.screenWidth,
                  clipBehavior: Clip.none,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          spreadRadius: deviceInfo.screenWidth * 0.25,
                          blurRadius: deviceInfo.screenWidth * 0.17,
                        )
                      ]
                  ),
                  child: Stack(

                  children:[

                    ...List.generate(2, (index) {
                      // Generate a random angle between 0 and 360 degrees
                      double rotationAngle = Random().nextDouble() * 2 * pi;

                      return Positioned(
                        top: index * deviceInfo.screenHeight * 0.8, // space them vertically
                        right: -deviceInfo.screenWidth * 0.45,
                        child: Transform.rotate(
                          angle: rotationAngle, // Apply random rotation angle
                          child: Image.asset(
                            ImagesNamesHelper.BackgroundShape,
                            height: deviceInfo.screenHeight * 0.55,
                          ),
                        ),
                      );
                    }),

                    // Right side shapes with different rotation angles
                    ...List.generate(3, (index) {
                      // Generate a random angle between 0 and 360 degrees
                      double rotationAngle = Random().nextDouble() * 2 * pi;

                      return Positioned(
                        top: index * deviceInfo.screenHeight * 1.7 + 100, // offset differently for variation
                        left: -deviceInfo.screenWidth * 0.45,
                        child: Transform.rotate(
                          angle: rotationAngle, // Apply random rotation angle
                          child: Image.asset(
                            ImagesNamesHelper.BackgroundShape,
                            height: deviceInfo.screenHeight * 0.55,
                          ),
                        ),
                      );
                    }),

                    Column(
                    children: [

                      Container(
                          width: deviceInfo.screenWidth * 0.45,
                          margin: EdgeInsetsDirectional.only(
                            end: deviceInfo.screenWidth * 0.45,

                          ),

                          child: Text(S.current.ourCategories, style: Theme.of(context).textTheme.headlineLarge, )
                      ),


                      if(state is CategoriesFetchedSuccessfully)
                        context.read<categoriesCubit>().Categories.isNotEmpty? ListView.builder(
                          itemCount: context.read<categoriesCubit>().Categories.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {


                            return GestureDetector(

                              onTap: (){


                                  ProductsCubit.Selectedcategory = context.read<categoriesCubit>().Categories[index];

                                  context.read<BottomNavBarCubit>().changeTab(1);
                              },
                              child: Container(
                                margin: EdgeInsetsDirectional.only(
                                    top: deviceInfo.screenHeight * 0.05,
                                    bottom: deviceInfo.screenHeight * 0.05),
                                padding: EdgeInsetsDirectional.only(
                                    start: deviceInfo.screenWidth * 0.13,
                                    end: deviceInfo.screenWidth * 0.13),
                                child: buildCategoyCard(deviceInfo: deviceInfo, context: context, index: index, BaseUrl: BaseUrl),
                              ),
                            );
                          },

                        ) : Container(
                          margin: EdgeInsetsDirectional.only(top: deviceInfo.screenHeight * 0.2, bottom: deviceInfo.screenHeight * 0.05),

                          child: Text(S.current.NoCategories, style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.w600, letterSpacing: -1), textAlign: TextAlign.center,),
                        ),

                      if(state is CategoriesFetchingLoading)
                        Container(
                          margin: EdgeInsetsDirectional.only(top: deviceInfo.screenHeight * 0.25, bottom: deviceInfo.screenHeight * 0.05),
                          child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
                        ),


                    ],
                  ),]
                  )

                )

              ],
            ),
          ),
          // bottomNavigationBar: CustomBottomNavBar(),   // bottomNavigationBar: ,
        );
      });

    });
  }


}
