import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/FormValidator/Validator.dart';
import '../../../../core/Localization/Locales/generated/l10n.dart';
import '../../../../core/Responsive/ui_component/info_widget.dart';
import '../logic/auth_cubit.dart';
import 'customTextField/customTextField.dart';

class CustomerData extends StatefulWidget{

  @override
  State<CustomerData> createState() => _CustomerDataState();

}

class _CustomerDataState extends State<CustomerData> {
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

              CustomTextField(label: S.current.city, hintText: 'Giza', controller: context.read<AuthCubit>().CityController, formValidator: ValidatorHelper.combineValidators([
                ValidatorHelper.isNotEmpty,
              ]),),

              CustomTextField(label: S.current.streetName, hintText: 'ElShorouk', controller: context.read<AuthCubit>().streetNameController, formValidator: ValidatorHelper.combineValidators([
                ValidatorHelper.isNotEmpty,

              ]),),
              CustomTextField(label: S.current.buildingNumber, hintText: '21', controller: context.read<AuthCubit>().builidngNumberController, formValidator: ValidatorHelper.combineValidators([
                ValidatorHelper.isNotEmpty,
                ValidatorHelper.isOnlyNumbers
              ]),),


              SizedBox(
                  width: deviceInfo.screenWidth * 0.75,
                  height: deviceInfo.screenHeight * 0.05,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
                    onPressed: (){
                      context.read<AuthCubit>().navigateToNextPage();
                    }, child: Text(S.current.next, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),),)
              )
            ]
        ),
      );});

  }}