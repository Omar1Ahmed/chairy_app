import 'package:chairy_app/Features/authentication/data/data_source/AuthenticaionRemoteDataSource.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/Localization/Locales/generated/l10n.dart';
import '../../../../core/network/Connectivity/connectivity_helper.dart';
import '../../data/model/auth_model.dart';
import 'auth_state.dart';

enum PayMethod { paypal, card }

class AuthCubit extends Cubit<AuthState> {
  final AuthenticationRemoteDataSource authenticationDataSource;
  AuthCubit(this.authenticationDataSource) : super(ToggleAuthState());

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  TextEditingController CityController = TextEditingController();
  TextEditingController streetNameController = TextEditingController();
  TextEditingController builidngNumberController = TextEditingController();

  PayMethod? selectedPayMethod = null;
  String Token = '';

  bool IsSignIn = true;

  toggleSignIn() {
    IsSignIn = !IsSignIn;
    emit(ToggleAuthState());
  }
  void clearFields(List<TextEditingController> controllers) {
    for (TextEditingController controller in controllers) {
      controller.clear();
    }
  }

  Future<void> logIn(BuildContext context) async {

    if (state is AuthLoadingState) return;
    emit(AuthLoadingState());
    try {
      final AuthModel response = await authenticationDataSource.login(
          emailController.text, passController.text);

      if(response.isSuccessful){
        Token = response.data!.token;
        emit(AuthLogInSuccessState());
      }else{

        emit(AuthLogInErrorState(message: response.message?? S.current.unexpectedError));
      }

    }on NoInternetConnectionException {

      emit(NoInternetConnection());

    } on DioException catch (dioException) {

        emit(AuthLogInErrorState(message: dioException.response!.statusMessage!));
    }catch (e) {

        emit(AuthLogInErrorState(message: e.toString()));
    }
  }

  Future<void> signUp(BuildContext context) async {

    if (state is AuthLoadingState) return;



    emit(AuthLoadingState());
    try {
       final AuthModel response =await authenticationDataSource.signUp(
          firstNameController.text[0].toUpperCase() +
              firstNameController.text.substring(1),
          lastNameController.text[0].toUpperCase() +
              lastNameController.text.substring(1),
          emailController.text,
          passController.text);



       if(response.isSuccessful){

         Token = response.data!.token;
      emit(AuthRegisterSuccessState());
       }else{

         print(response.message);
        emit(AuthRegisterFailedState(message: response.message?? S.current.unexpectedError));
       }

    }on NoInternetConnectionException {

      emit(NoInternetConnection());

    } on DioException catch (dioException) {

      emit(AuthRegisterFailedState(message: dioException.response!.statusMessage!));
    }catch (e) {

      emit(AuthRegisterFailedState(message: e.toString()));
    }
  }

  navigateToNextPage(){
    emit(NavigateToNextPage());
  }

  togglePaymentMethod(PayMethod method){

    selectedPayMethod = method;
    emit(TogglePaymentMethod());
  }
}
