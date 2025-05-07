import 'package:chairy_app/Features/cart/presentation/cart_screen/logic/cart_cubit.dart';
import 'package:chairy_app/Features/place_order/presentation/place_order_screen/logic/place_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Localization/Locales/generated/l10n.dart';
import '../../../../core/Responsive/ui_component/info_widget.dart';
import '../../../../core/helper/ImagesNamesHelper/ImagesNamesHelper.dart';
import '../../../cart/presentation/cart_screen/ui/widget/customProductCartRow.dart';
import '../logic/auth_cubit.dart';

class ReviewTheOrder extends StatefulWidget{

  @override
  State<ReviewTheOrder> createState() => _ReviewTheOrderState();
}

class _ReviewTheOrderState extends State<ReviewTheOrder> {
  @override
  Widget build(BuildContext context) {
    return InfoWidget(builder: (context, deviceInfo) {

      return Container(
        padding: EdgeInsetsDirectional.only(start: deviceInfo.screenWidth * 0.06, end: deviceInfo.screenWidth * 0.06),
        child: Column(

            children: [
              Column(
                children: [
                  Text(S.current.YourCustomerDataForTheOrder, style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                  Text(S.current.bringingYouStyleHome, style: Theme.of(context).textTheme.bodyLarge,),
                ],
              ),

                      SizedBox(
                      width: deviceInfo.screenWidth,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(context.read<AuthCubit>().firstNameController.text, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),),
                      Text(S.current.reviewYourItems, style: Theme.of(context).textTheme.bodyLarge,),
                    ],
                  ),
                  ),

                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                                Text(S.current.address, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w900),),
                              Container(
                                width: deviceInfo.screenWidth * 0.35,
                                height: deviceInfo.screenHeight * 0.14,
                                padding: EdgeInsetsDirectional.only(start: deviceInfo.screenWidth * 0.02, end: deviceInfo.screenWidth * 0.02, top: deviceInfo.screenHeight * 0.01, bottom: deviceInfo.screenHeight * 0.01),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).dividerColor,
                                  borderRadius: BorderRadius.circular(deviceInfo.screenWidth * 0.02),
                                ),
                                child: Column(
                                  children: [

                                    Text('${context.read<AuthCubit>().firstNameController.text} ${context.read<AuthCubit>().lastNameController.text}', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),),
                                    Text(context.read<AuthCubit>().CityController.text, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),),
                                    Text(context.read<AuthCubit>().streetNameController.text, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),),
                                    Text(context.read<AuthCubit>().builidngNumberController.text, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),),
                                    Text(context.read<AuthCubit>().CityController.text, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),),


                                  ],
                                )
                              )
                            ],
                          ),

                          Column(
                            children: [
                              Text(S.current.address, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w900),),
                              Container(
                                  width: deviceInfo.screenWidth * 0.35,
                                  height: deviceInfo.screenHeight * 0.14,
                                  padding: EdgeInsetsDirectional.only(start: deviceInfo.screenWidth * 0.02, end: deviceInfo.screenWidth * 0.02, top: deviceInfo.screenHeight * 0.01, bottom: deviceInfo.screenHeight * 0.01),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).dividerColor,
                                    borderRadius: BorderRadius.circular(deviceInfo.screenWidth * 0.02),
                                  ),
                                  child: Column(

                                    children: [

                                      Text(context.read<AuthCubit>().selectedPayMethod == PayMethod.card ? S.current.cardPayment : S.current.paypalPayment, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),),

                                      Container(
                                        margin: EdgeInsetsDirectional.only(top: deviceInfo.screenHeight * 0.025,end: deviceInfo.screenWidth * 0.15),
                                      child: Image.asset(context.read<AuthCubit>().selectedPayMethod == PayMethod.card ? ImagesNamesHelper.Mastercardlogo : ImagesNamesHelper.PayPalLogo, width: deviceInfo.screenWidth * 0.2,),
                                      )



                                    ],
                                  )
                              )
                            ],
                          )

                        ],
                      ),

              Container(
                width: deviceInfo.screenWidth,
                  height: deviceInfo.screenHeight * 0.3,
                  margin: EdgeInsetsDirectional.only(top: deviceInfo.screenHeight * 0.02),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).dividerColor,
                    borderRadius: BorderRadius.circular(deviceInfo.screenWidth * 0.02),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(S.of(context).shoppingCartItems(context.read<CartCubit>().cartItemsCount), style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w900),),

                      Expanded(
                          child:
                          ListView.builder(
                            shrinkWrap: true,
                          itemCount: context.read<CartCubit>().cartItems.length,
                          itemBuilder: (context, index) {

                            return Padding(padding: EdgeInsetsDirectional.only(
                                start: deviceInfo.screenWidth * 0.02,
                                end: deviceInfo.screenWidth * 0.02,
                            ),
                              child: buildProductCartRow(deviceInfo: deviceInfo, context: context, cartItem: context.read<CartCubit>().cartItems[index]!, index: index, fromCart: false,)

                            );
                          }

                      ),
                      )
                    ],
                  )),


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
                  width: deviceInfo.screenWidth * 0.75,
                  height: deviceInfo.screenHeight * 0.05,
                  margin: EdgeInsetsDirectional.only(top: deviceInfo.screenHeight * 0.04),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
                    onPressed: () async {

                      await context.read<CartCubit>().addListOfProductsAPI(token: context.read<AuthCubit>().Token!);

                    }, child: context.read<PlaceOrderCubit>().state is PlaceOrderLoadingState ? CircularProgressIndicator(color: Colors.white,) : Text(S.current.next, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),),)
              )
            ]
        ),
      );});
  }
}

