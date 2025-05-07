import 'package:chairy_app/Features/authentication/presentation/logic/auth_cubit.dart';
import 'package:chairy_app/Features/authentication/presentation/logic/auth_state.dart';
import 'package:chairy_app/Features/authentication/presentation/widgets/CustomerData.dart';
import 'package:chairy_app/Features/authentication/presentation/widgets/ReviewTheOrder.dart';
import 'package:chairy_app/Features/authentication/presentation/widgets/customTextField/customTextField.dart';
import 'package:chairy_app/Features/authentication/presentation/widgets/getThePaymentMethod.dart';
import 'package:chairy_app/Features/cart/presentation/cart_screen/logic/cart_cubit.dart';
import 'package:chairy_app/Features/place_order/presentation/place_order_screen/logic/place_order_cubit.dart';
import 'package:chairy_app/core/FormValidator/Validator.dart';
import 'package:chairy_app/core/Responsive/Models/device_info.dart';
import 'package:chairy_app/core/Responsive/ui_component/info_widget.dart';
import 'package:chairy_app/core/helper/extantions.dart';
import 'package:chairy_app/core/shared/widgets/BottomNavBar/cubit/bottom_nav_bar_cubit.dart';
import 'package:chairy_app/core/shared/widgets/cherryToast/CherryToastMsgs.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Localization/Locales/generated/l10n.dart';
import '../../../../../core/shared/widgets/CustomAppbar.dart';
import '../../../../authentication/presentation/widgets/AuthToggle.dart';
import '../../../../authentication/presentation/widgets/signUp.dart';

class PlaceOrderScreen extends StatefulWidget {
  @override
  _PlaceOrderScreenState createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  final stepLabels = ['REGISTER', 'DATA', 'PAYMENT', 'REVIEW'];

  @override
  Widget build(BuildContext context) {
    return InfoWidget(builder: (context, deviceInfo){
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: CustomAppbar(deviceInfo: deviceInfo, context: context, showActionsIcons: false,
        isInHome: false,
        ),
        body: InfoWidget(builder: (context, deviceInfo) {
          return BlocListener<CartCubit,CartState>(listener: (context,state) async {

            if(state is CartLoading){
              print('loading Stattttttttttteeeeee cart');
              await CherryToastMsgs.CherryToastInfo(info: deviceInfo, context: context, title: S.current.loading, description: S.current.addingProductsLoading);
            }

            if(state is ProductsListAddedToCartSuccessfully){
              print('uploaded Cart Products');
              await CherryToastMsgs.CherryToastSuccess(info: deviceInfo, context: context, title: S.current.success, description: S.current.productsAddedToCartSuccessfully);
              await context.read<PlaceOrderCubit>().placeOrder(token: context.read<AuthCubit>().Token!, StreetName: context.read<AuthCubit>().streetNameController.text, City: context.read<AuthCubit>().CityController.text, PaymentMethod: context.read<AuthCubit>().selectedPayMethod.toString());
            }
          },child: BlocConsumer<PlaceOrderCubit, PlaceOrderState>(
              listener: (context, state) async {

                if(state is PlaceOrderSuccessState){
                  await CherryToastMsgs.CherryToastSuccess(info: deviceInfo, context: context, title: S.current.success, description: S.current.orderPlacedSuccessfully);
                  context.pop();
                  context.read<CartCubit>().clearCart();
                  context.read<BottomNavBarCubit>().changeTab(0);
                }

                if(state is PlaceOrderErrorState){
                  await CherryToastMsgs.CherryToastError(info: deviceInfo, context: context, title: S.current.error, description: state.message);
                }
              },
              builder: (context, state) {
                print(state);
                return SingleChildScrollView(
                  child: Column (

                      children: [
                        Container(
                          margin: EdgeInsetsDirectional.only( top: deviceInfo.screenHeight * 0.02,start: deviceInfo.screenWidth * 0.2),
                          child: Row(
                            children: List.generate(7, (i) {
                              if (i.isOdd) {
                                return _buildArrow(deviceInfo: deviceInfo);
                              } else {
                                int stepIndex = i ~/ 2;
                                bool isCompleted = stepIndex <= context.read<PlaceOrderCubit>().currentStep;
                                bool isCurrent = stepIndex == context.read<PlaceOrderCubit>().currentStep;

                                return GestureDetector(
                                  onTap: () {
                                    if (stepIndex < context.read<PlaceOrderCubit>().currentStep) {
                                      context.read<PlaceOrderCubit>().goToStep(stepIndex);
                                    }
                                  },
                                  child: _buildIndicator(
                                    stepLabels[stepIndex],
                                    isCompleted: isCompleted,
                                    isCurrent: isCurrent,
                                    deviceInfo: deviceInfo,
                                  ),
                                );
                              }
                            }),
                          ),
                        ),


                        SizedBox(height: deviceInfo.screenHeight * 0.01,),
                        BlocConsumer<AuthCubit, AuthState>(
                          listener: (context, state) async {

                            print(state);
                            if(state is AuthRegisterSuccessState){
                              await CherryToastMsgs.CherryToastSuccess(info: deviceInfo, context: context, title: S.current.success, description: S.current.registerSuccessfully);
                              context.read<PlaceOrderCubit>().nextStep();
                            }

                            if(state is AuthRegisterFailedState){
                              await CherryToastMsgs.CherryToastError(info: deviceInfo, context: context, title: S.current.unexpectedError, description: state.message);

                            }

                            if(state is AuthLogInSuccessState){
                              await CherryToastMsgs.CherryToastSuccess(info: deviceInfo, context: context, title: S.current.success, description: S.current.loginSuccessfully);
                              context.read<PlaceOrderCubit>().nextStep();
                            }

                            if(state is AuthLogInErrorState){
                              await CherryToastMsgs.CherryToastError(info: deviceInfo, context: context, title: S.current.unexpectedError, description: state.message);
                            }

                            if(state is NavigateToNextPage){
                              context.read<PlaceOrderCubit>().nextStep();
                            }




                          },
                          builder: (context, state){
                            if(context.read<PlaceOrderCubit>().currentStep == 0)
                              return AuthToggle();
                            if(context.read<PlaceOrderCubit>().currentStep == 1)
                              return CustomerData();
                            if(context.read<PlaceOrderCubit>().currentStep == 2)
                              return getThePaynementMethod();
                            else
                              return ReviewTheOrder();
                          },),

                      ]),
                );
              }
          ),);
        })
      );
    });
  }

  Widget _buildIndicator(String label, {required bool isCompleted, required bool isCurrent,required DeviceInfo deviceInfo}) {
    Color fillColor = isCompleted ? Colors.green : Colors.grey.shade400;
    Color textColor = isCompleted ? Colors.green : Colors.grey.shade700;

    return Padding(
      padding: EdgeInsetsDirectional.only(end: deviceInfo.screenWidth * 0.01, start: deviceInfo.screenWidth * 0.01),
      child: Column(
        children: [
          Container(
            width: deviceInfo.screenWidth * 0.06,
            height: deviceInfo.screenWidth * 0.07,
            decoration: BoxDecoration(
              color: fillColor,
              shape: BoxShape.circle,
              border: isCurrent ? Border.all(color: Colors.black, width: deviceInfo.screenWidth * 0.002) : null,
            ),
            child: isCompleted
                ? Icon(Icons.check, size: deviceInfo.screenWidth * 0.04, color: Colors.white)
                : null,
          ),
          SizedBox(height: deviceInfo.screenHeight * 0.003),
          Text(label, style: TextStyle(fontSize: deviceInfo.screenWidth * 0.03, color: textColor,fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildArrow({required DeviceInfo deviceInfo}) {
    return Icon(Icons.arrow_forward_ios, size: deviceInfo.screenWidth * 0.04, color: Colors.grey.shade400);
  }
}
