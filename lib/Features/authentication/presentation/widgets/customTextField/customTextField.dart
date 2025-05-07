import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Responsive/ui_component/info_widget.dart';
import '../../logic/password_visiblity_bloc.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final bool isPassword;
  final String? Function(String?)? formValidator;

  const CustomTextField({super.key, required this.label, required this.hintText, required this.controller, this.isPassword = false, this.formValidator});

  @override
  State<CustomTextField> createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

    void _validate() {
        _errorMessage = widget.formValidator?.call(widget.controller.text);
        setState(() {
        });
    }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (_) => PasswordVisibilityCubit(),
      child: InfoWidget(builder: (context, info) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          BlocBuilder<PasswordVisibilityCubit, bool>(
            builder: (context, isHidden) {
              return Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      color: Theme.of(context).dividerColor,
                      spreadRadius: info.screenWidth * 0.01,
                      blurRadius: info.screenWidth * 0.04,
                    ),
                  ]),
                  child: TextFormField(
                    controller: widget.controller,
                    validator: widget.formValidator,
                    onChanged: (value) {
                      _validate();
                    },

                style: TextStyle(color: Theme.of(context).textTheme.labelMedium!.color),
                    obscureText: widget.isPassword ? isHidden : false,
                    decoration: InputDecoration(
                      label: Text(widget.label, style: TextStyle(color: Colors.grey, fontSize: info.screenWidth * 0.035, fontWeight: FontWeight.w900)),
                      hintText: widget.hintText,
                      hintStyle: TextStyle(color: Colors.grey, fontSize: info.screenWidth * 0.035, fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(info.screenWidth * 0.04)),
                      enabledBorder: _errorMessage == null
                          ? OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(info.screenWidth * 0.04))
                          : OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: info.screenWidth * 0.003),
                        borderRadius: BorderRadius.circular(info.screenWidth * 0.04),
                      ),
                      focusedBorder: _errorMessage == null
                          ? OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor, width: info.screenWidth * 0.003), borderRadius: BorderRadius.circular(info.screenWidth * 0.04))
                          : OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: info.screenWidth * 0.003),
                        borderRadius: BorderRadius.circular(info.screenWidth * 0.04),
                      ),
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.onPrimary,
                      suffixIcon: widget.isPassword
                          ? IconButton(
                        icon: Icon(isHidden ? Icons.visibility_off : Icons.visibility),
                        onPressed: () => context.read<PasswordVisibilityCubit>().toggleVisibility(),
                      )
                          : null,
                    ),
                    textInputAction: TextInputAction.next,
                  ));
            },
          ),

            if (_errorMessage != null)
            Container(

              child: Text(
                _errorMessage!,
                style: TextStyle(color: Colors.red, fontSize: info.screenWidth * 0.034, fontWeight: FontWeight.w500),
              ),
            )
        ]);
      }),
    );
  }
}
