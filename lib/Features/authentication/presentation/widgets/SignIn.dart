import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/FormValidator/Validator.dart';
import '../../../../core/Localization/Locales/generated/l10n.dart';
import '../../../../core/Responsive/ui_component/info_widget.dart';
import '../logic/auth_cubit.dart';
import 'customTextField/customTextField.dart';

class SignIn extends StatefulWidget{
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                  Text(S.current.wolcomeToYourStore, style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w600),),
                  Text(S.current.bringingYouStyleHome, style: Theme.of(context).textTheme.bodyLarge,),
                ],
              ),


              CustomTextField(label: S.current.email, hintText: 'omar@efwq.com', controller: context.read<AuthCubit>().emailController, formValidator: ValidatorHelper.combineValidators([
                ValidatorHelper.isNotEmpty,
                ValidatorHelper.isValidEmail,
              ]),),

              CustomTextField(label: S.current.password, hintText: '12345678', controller: context.read<AuthCubit>().passController,isPassword: true, formValidator: ValidatorHelper.combineValidators([
                ValidatorHelper.isNotEmpty,
                ValidatorHelper.isValidPassword,
              ]),),

              SizedBox(
                  width: deviceInfo.screenWidth * 0.75,
                  height: deviceInfo.screenHeight * 0.05,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
                    onPressed: (){
                      context.read<AuthCubit>().logIn(context);

                    }, child: Text(S.current.signIn, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.w600),),)
              )
            ]
        ),
      );});
  }
}