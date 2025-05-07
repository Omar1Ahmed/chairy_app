import 'package:bloc/bloc.dart';
import 'package:chairy_app/Features/place_order/data/data_source/place_order_remote_data_source.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'place_order_state.dart';


class PlaceOrderCubit extends Cubit<PlaceOrderState> {
  PlaceOrderRemoteDataSource placeOrderRemoteDataSource;
  PlaceOrderCubit({required this.placeOrderRemoteDataSource}) : super(PlaceOrderInitial()); // 0 = REGISTER step

  final int maxStep = 3;
  int currentStep = 0;

  void nextStep() {
    if (currentStep < maxStep) {
      currentStep += 1;
      emit(PlaceOrderChangeIndicatorStep());
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      currentStep -= 1;
      emit(PlaceOrderChangeIndicatorStep());    }
  }

  void goToStep(int step) {
    if (step >= 0 && step <= maxStep) {
      print('Steeep $step');
      currentStep = step;
      emit(PlaceOrderChangeIndicatorStep());
    }
  }

  Future<void> placeOrder({required String token, required String StreetName, String Country = 'Egypt',required String City, required String PaymentMethod}) async {
    emit(PlaceOrderLoadingState());
    try{final response = await placeOrderRemoteDataSource.placeOrder(token: token, StreetName: StreetName, City: City, PaymentMethod: PaymentMethod );

    if (response.isSuccessful) {
      emit(PlaceOrderSuccessState());
    } else {
      emit(PlaceOrderErrorState(message: response.message));
    }
    }on DioException catch (dioException) {
      emit(PlaceOrderErrorState(message: dioException.message!));
    }catch(e){
      emit(PlaceOrderErrorState(message: e.toString()));
    }
  }
}
