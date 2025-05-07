import 'package:chairy_app/Features/cart/domain/entity/cartItemEntity.dart';
import 'package:chairy_app/Features/cart/presentation/cart_screen/logic/cart_cubit.dart';
import 'package:chairy_app/Features/cart/presentation/cart_screen/ui/widget/customProductCartRow.dart';
import 'package:chairy_app/core/Responsive/Models/device_info.dart';
import 'package:chairy_app/core/Responsive/ui_component/info_widget.dart';
import 'package:chairy_app/core/helper/ImagesNamesHelper/ImagesNamesHelper.dart';
import 'package:chairy_app/core/helper/extantions.dart';
import 'package:chairy_app/core/routing/routs.dart';
import 'package:chairy_app/core/shared/widgets/CustomAppbar.dart';
import 'package:chairy_app/core/shared/widgets/cherryToast/CherryToastMsgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Localization/Locales/generated/l10n.dart';
import '../../../../../core/helper/dotenv/dot_env_helper.dart';
import '../../../../authentication/presentation/logic/auth_cubit.dart';
import '../../../../place_order/presentation/place_order_screen/logic/place_order_cubit.dart';

class cartScreen extends StatefulWidget {

  @override
  State<cartScreen> createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {



  @override
  Widget build(BuildContext context) {
    return InfoWidget(builder: (context, deviceInfo) {
      return Scaffold(
        appBar: CustomAppbar(deviceInfo: deviceInfo, context: context),
        body: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) async {

            if(state is CartItemDeletedSuccessfully){
              await CherryToastMsgs.CherryToastSuccess(info: deviceInfo, context: context, title: S.current.success, description: S.current.deletedSuccessfully);

            }


          },
          builder: (context, state){
            if(context.read<CartCubit>().cartItems.isEmpty){
              return Center(
                child:
              Stack(
                alignment: Alignment.center,

                children: [
                  Container(
                    height: deviceInfo.screenHeight*0.4,

                    child:  Image.asset(ImagesNamesHelper.BackgroundShape,
                      width: deviceInfo.screenWidth*0.9,
                      height: deviceInfo.screenHeight*0.35,
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(S.current.yourCartIsEmpty,style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),),
                      Text(S.current.ChooseItems,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),),
                    ],
                  )
                ],
              ),);
            }
            return SizedBox(
              width: deviceInfo.screenWidth,
              child: Column(
                spacing :  deviceInfo.screenHeight*0.01,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


                    Stack(
                    alignment: Alignment.center,

                    children: [
                  Container(
                    height: deviceInfo.screenHeight*0.25,

                    child:  Image.asset(ImagesNamesHelper.BackgroundShape,
                  width: deviceInfo.screenWidth*0.9,
                    height: deviceInfo.screenHeight*0.35,
                  ),
                  ),

                  Container(
                    padding: EdgeInsetsDirectional.only(bottom: deviceInfo.screenHeight*0.02),

                    child: Column(
                      children: [
                        Text(S.current.yourCart,style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),),
                        Text(S.current.reviewYourItems,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),),
                      ],
                    ),
                  )
                    ],
                  ),

                  Expanded(
                      child: ListView.builder(
                        itemCount: context.read<CartCubit>().cartItems.length,
                        padding: EdgeInsetsDirectional.only(start: deviceInfo.screenWidth*0.06, end: deviceInfo.screenWidth*0.06),
                        itemBuilder: (context, index) {
                          final cartItem = context.read<CartCubit>().cartItems[index]!;
                          return buildProductCartRow(deviceInfo: deviceInfo, context: context, cartItem: cartItem, index: index);
                        }
                      ) ),


                  Divider(height: deviceInfo.screenWidth*0.01, thickness: deviceInfo.screenWidth*0.003, color: Theme.of(context).dividerColor,),

                  Container(
                    width: deviceInfo.screenWidth*0.8,
                  // margin: EdgeInsetsDirectional.only(top: deviceInfo.screenHeight*0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(S.current.totalPrice,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),),
                      Spacer(),
                      Text(context.read<CartCubit>().totalPrice.toString(),style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),),
                    ],
                  ),
                  ),



                  Container(
                    width: deviceInfo.screenWidth*0.9,
                    height: deviceInfo.screenHeight*0.06,
                    // margin: EdgeInsetsDirectional.only(bottom: deviceInfo.screenHeight*0.02),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
                        onPressed: (){

                          context.pushNamed(Routes.PlaceOrderScreen);
                    }, child: Text(S.current.placeOrder,style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white,fontWeight: FontWeight.w600),)),
                  )
                ],
              ),
            );
          },
        ),
      );
    });
  }


}