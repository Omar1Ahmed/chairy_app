import 'dart:ui';

import 'package:chairy_app/Features/cart/presentation/cart_screen/logic/cart_cubit.dart';
import 'package:chairy_app/Features/products/presentation/productsScreen/logic/products_cubit.dart';
import 'package:chairy_app/Features/products/presentation/productsScreen/ui/Widgets/GridViewProductCard.dart';
import 'package:chairy_app/core/Responsive/Models/device_info.dart';
import 'package:chairy_app/core/Responsive/ui_component/info_widget.dart';
import 'package:chairy_app/core/helper/extantions.dart';
import 'package:chairy_app/core/routing/routs.dart';
import 'package:chairy_app/core/shared/widgets/BottomNavBar/CustomBottomNavBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/dotenv/dot_env_helper.dart';
import '../../../../../core/shared/widgets/CustomAppbar.dart';
import '../../../../categories/presentation/categories/logic/categories_cubit.dart';

class productsScreen extends StatefulWidget {

  @override
  State<productsScreen> createState() => _productsScreenState();
}

class _productsScreenState extends State<productsScreen> {


  late String BaseUrl ;

  @override
  void initState() {
    BaseUrl = EnvHelper.getString('BASE_URL');
    context.read<ProductsCubit>().getProductsByCategory();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return InfoWidget(builder: (context, deviceInfo) {
      return Scaffold(
        appBar: CustomAppbar(deviceInfo: deviceInfo, context: context),
        body: SingleChildScrollView(
          child: BlocConsumer<ProductsCubit, ProductsState>(
              listener: (context, state){

              },
              builder: (context, state) {

                print('final State $state');
                 return state is ProductsFetchedSuccessfully ?
                   Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(top: deviceInfo.screenHeight * 0.02, bottom: deviceInfo.screenHeight * 0.04),
                        height: deviceInfo.screenHeight * 0.34,
                        width: deviceInfo.screenWidth* 0.77,

                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [

                            Positioned.fill(
                              top: deviceInfo.screenHeight * 0.04,
                              right: deviceInfo.screenWidth * 0.04,
                              left: deviceInfo.screenWidth * 0.04,
                              child: Image.network(
                                BaseUrl+state.CurrentCategory.image,
                                fit: BoxFit.cover,

                              ),
                            ),

                            Positioned.fill(
                              child: BackdropFilter(
                                blendMode: BlendMode.src,
                                filter: ImageFilter.blur(sigmaX: 50, sigmaY: 70),

                                child: Container(color: Colors.transparent),
                              ),
                            ),
                            PositionedDirectional(
                              start: deviceInfo.screenWidth * 0.22,
                              top: deviceInfo.screenHeight * 0.15,
                              height: deviceInfo.screenHeight * 0.18,
                              width: deviceInfo.screenWidth* 0.63,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(deviceInfo.screenWidth * 0.1),
                                  color: Theme.of(context).dividerColor.withAlpha(170),
                                ),
                              ),
                            ),

                            PositionedDirectional(
                              end: deviceInfo.screenWidth * 0.22,
                              bottom: deviceInfo.screenHeight * 0.07,
                              height: deviceInfo.screenHeight * 0.3,
                              width: deviceInfo.screenWidth* 0.63,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(deviceInfo.screenWidth * 0.1),
                                  color: Theme.of(context).dividerColor.withAlpha(170),
                                ),
                              ),
                            ),


                            Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(deviceInfo.screenWidth * 0.1)),
                                clipBehavior: Clip.antiAlias,
                                child: Image.network(
                                  BaseUrl+state.CurrentCategory.image,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: deviceInfo.screenHeight * 0.37,

                                )
                            )
                          ],
                        ),
                      ),



                      Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: deviceInfo.screenWidth * 0.06,
                          ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.CurrentCategory.title, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).primaryColor), textAlign: TextAlign.start,),
                          Text(state.CurrentCategory.title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.start,),
                          Text(state.CurrentCategory.description, style: Theme.of(context).textTheme.bodySmall!, textAlign: TextAlign.start,),
                        ],
                      ),
                      ),

                      SizedBox(height: deviceInfo.screenHeight*0.1,),

                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsetsDirectional.only(start: deviceInfo.screenWidth * 0.06, end: deviceInfo.screenWidth * 0.06),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: deviceInfo.screenWidth * 0.08, mainAxisSpacing: deviceInfo.screenWidth * 0.01,childAspectRatio: deviceInfo.screenWidth / deviceInfo.screenHeight * 1.5),
                          itemCount: context.read<ProductsCubit>().Products.length,
                          itemBuilder:  (context, index) {
                            return buildProductsGridViewCard(deviceInfo: deviceInfo, context: context,Link:  BaseUrl+state.products[index].images[0].link, index: index);

                          })
                    ],
                  )
                 : state is ProductsLoading ?
                 Container(
                   width: deviceInfo.screenWidth,
                   height: deviceInfo.screenHeight,
                   child: Center(
                     child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
                   ),
                 ) :  SizedBox();

              }),
        ),

        // bottomNavigationBar: CustomBottomNavBar(),
      );

    });


  }

}

