import 'package:chairy_app/Features/cart/data/model/cartProductsTransaction.dart';
import 'package:chairy_app/core/network/dio_client.dart';

abstract class CartRemoteDataSource {

  addProduct({required String ItemId, required String qty, required String token});
  removeProduct({required String ItemId});
  decreaseProduct({required String ItemId});
  getCartItems({required String token});
}

class CartRemoteDataSourceImp implements CartRemoteDataSource  {
  DioClient dioClient;

  CartRemoteDataSourceImp({required this.dioClient});

  @override
  Future<CartProductTransactionsModel> addProduct({required String ItemId, required String qty,required String token}) async {
    try {
      final response = await dioClient.post(
        '/api/cart/add-item',
        body: {
          'item_id': ItemId,
          'qty': qty
        },
        header: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }
      );
      print('add Product $response');
      return CartProductTransactionsModel.fromJson(response);
    }catch(e,t){
      print(e);
      print(t);
      throw e;
    }
  }

  @override
  decreaseProduct({required String ItemId}) async {
    try {
      final response = await dioClient.post(
        '/api/cart/decrease-item',
        body: {
          'item_id': ItemId,

        },
      );
      print(response);
      return CartProductTransactionsModel.fromJson(response);
    }catch(e){
      print(e);

      throw e;
    }
  }

      @override
      getCartItems({required String token}) async {
      try {
      final response = await dioClient.get(
      '/api/cart/items',
      header: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      }
      );
      print(response);
      return CartProductTransactionsModel.fromJson(response);
      }catch(e){
      print(e);

      throw e;
      }
      }

  @override
  removeProduct({required String ItemId}) async {
    try {
      final response = await dioClient.post(
        '/api/cart/remove-item',
        body: {
          'item_id': ItemId,

        },
      );
      print(response);
      return CartProductTransactionsModel.fromJson(response);
    }catch(e){
      print(e);

      throw e;
    }
  }
}