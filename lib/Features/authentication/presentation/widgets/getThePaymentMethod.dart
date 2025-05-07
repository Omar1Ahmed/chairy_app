import 'package:chairy_app/core/shared/widgets/cherryToast/CherryToastMsgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Localization/Locales/generated/l10n.dart';
import '../../../../core/Responsive/ui_component/info_widget.dart';
import '../logic/auth_cubit.dart';

class getThePaynementMethod extends StatefulWidget{

  @override
  State<getThePaynementMethod> createState() => _getThePaynementMethodState();
}

class _getThePaynementMethodState extends State<getThePaynementMethod> {
  @override
  Widget build(BuildContext context) {
    return InfoWidget(builder: (context, deviceInfo) {

      return Container(
        padding: EdgeInsetsDirectional.only(start: deviceInfo.screenWidth * 0.06, end: deviceInfo.screenWidth * 0.06),
        child: Column(
            spacing: deviceInfo.screenHeight * 0.034,
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
              Text(S.current.selectPaymentMethod, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),),

                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                  SizedBox(
                  width: deviceInfo.screenWidth * 0.75,
                  child: RadioListTile<PayMethod?>(
                    title: Text('PayPal',style: Theme.of(context).textTheme.bodyMedium,),
                    value: PayMethod.paypal,
                    groupValue: context.read<AuthCubit>().selectedPayMethod,

                    fillColor: WidgetStateProperty.all(Theme.of(context).primaryColor),
                    onChanged: (payMethod) {
                      context.read<AuthCubit>().togglePaymentMethod(payMethod!);
                      },
                  ),
                  ),Icon(Icons.paypal, color: Theme.of(context).primaryColor,)
                    ],
                  ),

                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      SizedBox(
                        width: deviceInfo.screenWidth * 0.75,
                        child: RadioListTile<PayMethod?>(
                          title: Text('Card',style: Theme.of(context).textTheme.bodyMedium,),
                          value: PayMethod.card,
                          fillColor: WidgetStateProperty.all(Theme.of(context).primaryColor),
                          groupValue: context.read<AuthCubit>().selectedPayMethod,
                          onChanged: (payMethod) {
                            context.read<AuthCubit>().togglePaymentMethod(payMethod!);
                          },
                        ),
                      ),
                      Icon(Icons.credit_card, color: Theme.of(context).primaryColor,)
                    ],
                  ),



                ],
              )
              ),



              Container(
                  width: deviceInfo.screenWidth * 0.75,
                  height: deviceInfo.screenHeight * 0.05,
                  margin: EdgeInsetsDirectional.only(top: deviceInfo.screenHeight * 0.04),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
                    onPressed: () async {

                      if(context.read<AuthCubit>().selectedPayMethod == null){
                        await CherryToastMsgs.CherryToastError(info: deviceInfo, context: context, title: S.current.error, description: S.current.choosePaymentMethod);
                      }else{
                        context.read<AuthCubit>().navigateToNextPage();
                      }
                    }, child: Text(S.current.next, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),),)
              )
            ]
        ),
      );});
  }
}