import 'package:chairy_app/Features/authentication/presentation/logic/auth_cubit.dart';
import 'package:chairy_app/core/Responsive/ui_component/info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/FormValidator/Validator.dart';
import '../../../../core/Localization/Locales/generated/l10n.dart';
import 'customTextField/customTextField.dart';

class signUp extends StatefulWidget {

  State<signUp> createState() => _signUpState();


}

class _signUpState extends State<signUp> {

  @override
  void initState() {
    super.initState();
  }

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

          CustomTextField(label: S.current.firstName, hintText: 'Omar', controller: context.read<AuthCubit>().firstNameController, formValidator: ValidatorHelper.combineValidators([
            ValidatorHelper.isNotEmpty,
          ]),),

          CustomTextField(label: S.current.lastName, hintText: 'Ahmed', controller: context.read<AuthCubit>().lastNameController, formValidator: ValidatorHelper.combineValidators([
            ValidatorHelper.isNotEmpty,

          ]),),
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
                  context.read<AuthCubit>().signUp(context);

                }, child: Text(S.current.signUp, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),),)
          )
        ]
                ),
      );});
  }
}