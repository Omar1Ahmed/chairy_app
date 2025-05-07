import 'package:chairy_app/Features/place_order/data/model/placeOrderModel.dart';
import 'package:chairy_app/core/network/dio_client.dart';

abstract class PlaceOrderRemoteDataSource {

  Future<PlaceOrderModel> placeOrder({required String token, required String StreetName, String Country = 'Egypt',required String City, required String PaymentMethod});
}

class PlaceOrderRemoteDataSourceImp implements PlaceOrderRemoteDataSource  {
  DioClient dioClient;

  PlaceOrderRemoteDataSourceImp({required this.dioClient});

  @override
  Future<PlaceOrderModel> placeOrder({required String token, required String StreetName, String Country = 'Egypt',required String City, required String PaymentMethod}) async {
    try {
      final response = await dioClient.post('api/order/create', body: {
        "shipping_street_address": StreetName,
        "shipping_state": City,
        "shipping_country": Country,
        "payment_method": PaymentMethod,
      },
      header: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      }
      );

      print('PlaceOderModel $response');
      return PlaceOrderModel.fromJson(response);
    }catch(e){
      print(e);

      throw e;
    }

  }
}