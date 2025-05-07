import 'package:chairy_app/Features/authentication/presentation/logic/auth_cubit.dart';
import 'package:chairy_app/Features/authentication/presentation/widgets/signUp.dart';
import 'package:chairy_app/core/Responsive/ui_component/info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/FormValidator/Validator.dart';
import '../../../../core/Localization/Locales/generated/l10n.dart';
import 'SignIn.dart';
import 'customTextField/customTextField.dart';

class AuthToggle extends StatefulWidget {
  const AuthToggle({Key? key}) : super(key: key);

  @override
  State<AuthToggle> createState() => _AuthToggleState();
}

class _AuthToggleState extends State<AuthToggle> {
  @override
  Widget build(BuildContext context) {
    return InfoWidget(builder: (context, deviceInfo) {

      return Container(

        child: Column(
            spacing: deviceInfo.screenHeight * 0.034,
            children: [
              Column(
                children: [
                  Text(S.current.wolcomeToYourStore, style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w600),),
                  Text(S.current.bringingYouStyleHome, style: Theme.of(context).textTheme.bodyLarge,),
                ],
              ),

              Row(

                children: [

              InkWell(
              onTap: (){
                context.read<AuthCubit>().toggleSignIn();
              },
                child: Container(
                      width: deviceInfo.screenWidth * 0.5,
                      height: deviceInfo.screenHeight * 0.05,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: context.read<AuthCubit>().IsSignIn ? Theme.of(context).primaryColor.withAlpha((deviceInfo.screenWidth * 0.1).toInt()) : Theme.of(context).dividerColor.withAlpha((deviceInfo.screenWidth * 0.1).toInt()),
                      border: Border(bottom: BorderSide(color: context.read<AuthCubit>().IsSignIn ? Theme.of(context).primaryColor : Theme.of(context).dividerColor, width: deviceInfo.screenWidth * 0.004)),
                      ),
                        child: Text(S.current.signIn, style: TextStyle(color: context.read<AuthCubit>().IsSignIn ? Theme.of(context).primaryColor : Theme.of(context).dividerColor,fontWeight: FontWeight.w900),)
                    ),
              ),
                  InkWell(
                    onTap: (){
                      context.read<AuthCubit>().toggleSignIn();
                    },
                    child: Container(
                      width: deviceInfo.screenWidth * 0.5,
                      height: deviceInfo.screenHeight * 0.05,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: context.read<AuthCubit>().IsSignIn ? Theme.of(context).dividerColor.withAlpha((deviceInfo.screenWidth * 0.1).toInt()) : Theme.of(context).primaryColor.withAlpha((deviceInfo.screenWidth * 0.1).toInt()),
                        border: Border(bottom: BorderSide(color: context.read<AuthCubit>().IsSignIn ? Theme.of(context).dividerColor : Theme.of(context).primaryColor, width: deviceInfo.screenWidth * 0.004)),
                      ),
                      child: Text(S.current.signUp, style: TextStyle(color: context.read<AuthCubit>().IsSignIn ? Theme.of(context).dividerColor : Theme.of(context).primaryColor,fontWeight: FontWeight.w900),),
                    ),
                  )
                  ]
              ),

              context.read<AuthCubit>().IsSignIn ? SignIn() : signUp(),
            ]
        ),
      );});
  }
}