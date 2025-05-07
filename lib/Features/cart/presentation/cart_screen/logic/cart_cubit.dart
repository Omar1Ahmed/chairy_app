import 'package:bloc/bloc.dart';
import 'package:chairy_app/Features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:chairy_app/Features/cart/domain/entity/cartItemEntity.dart';
import 'package:chairy_app/Features/products/domain/entity/productEntity.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../../../core/network/Connectivity/connectivity_helper.dart';
import '../../../../authentication/presentation/logic/auth_state.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartRemoteDataSource cartRemoteDataSource;
  CartCubit(this.cartRemoteDataSource) : super(CartInitial());


  int cartItemsCount = 0;
  List<CartItemEntity?> cartItems = [];

  double totalPrice = 0.0;

  int quantityToBeAdded = 0;

void updateDirectQuantity({required CartItemEntity cartItem, required int quantity}) {

  for (var item in cartItems) {
    if (item?.product.id == cartItem.product.id && item?.product.categories[0].id == cartItem.product.categories[0].id) {
      item?.quantity = quantity;
      break;
    }
  }

  cartItemsCount = getTotalQuantityAndPrice();
    emit(QuantityUpdated());
  }

  void setQuantityToBeAdded(int quantity) {
    if (quantity < 0) {
      quantityToBeAdded = 0;
    } else {
      quantityToBeAdded = quantity;
    }
    emit(QuantityUpdated());
  }

  void updateCartItemsCount(int count){
    cartItemsCount = count;
  }


  Future<void> addToCart({required ProductEntity product, int? quantity}) async {


    CartItemEntity? existingItem;
    for (var item in cartItems) {
      if (item?.product.id == product.id && item?.product.categories[0].id == product.categories[0].id) {
        existingItem = item;
        break;
      }
    }

    if (existingItem != null) {

      if(quantity != null){

        existingItem.quantity = quantity;

      }else{

        existingItem.quantity += 1;

      }


      // await addItemAPI(ItemId: product.id.toString(), qty: existingItem.quantity.toString()); // increasing quantity

    } else {


      cartItems.add(CartItemEntity(product: product, quantity: quantity ?? 1));

      // await addItemAPI(ItemId: product.id.toString(), qty: quantity.toString()); // adding new item
    }

    cartItems.removeWhere((item) => (item?.quantity ?? 0) <= 0);

    cartItemsCount = getTotalQuantity();
      updateCartItemsCount(cartItemsCount);

      emit(AddedToCartSuccessfully());
  }

  void removeFromCart(ProductEntity product) {
    cartItems.removeWhere((item) => item?.product.id == product.id);
    cartItemsCount = getTotalQuantityAndPrice();
    emit(CartItemDeletedSuccessfully());
  }


  int getTotalQuantity() {
    int totalQuantity = 0;
    for (var item in cartItems) {
      totalQuantity += item?.quantity ?? 0;
    }
    return totalQuantity;
  }

  int getTotalQuantityAndPrice() {
    int totalQuantity = 0;
    double total = 0.0;
    for (var item in cartItems) {
      totalQuantity += item?.quantity ?? 0;
      if (item != null) {
        total += (double.parse(item.product.price) * item.quantity);
      }
    }
    totalPrice = total;
    return totalQuantity;
  }



  addListOfProductsAPI({required String token}) async {

  try {

    print('started uploading');
      cartItems.forEach((element) async {
        await _addProductToCart(ItemId: element?.product.id.toString() ?? '', qty: element?.quantity.toString() ?? '',token: token);
      });
      emit(ProductsListAddedToCartSuccessfully());

    }on NoInternetConnectionException {

      emit(NoInternetConnection());

    } on DioException catch (dioException) {

      emit(CartItemError(message: dioException.response!.statusMessage!));
    }catch (e) {

      emit(CartItemError(message: e.toString()));
    }
}

_addProductToCart({required String ItemId, required String qty,required String token}) async {

  emit(CartLoading());
  try {
    final response = await cartRemoteDataSource.addProduct(ItemId: ItemId, qty: qty,token: token);
  print(response);

  emit(AddedToCartSuccessfully());
  }on NoInternetConnectionException {

    emit(NoInternetConnection());

  } on DioException catch (dioException) {

    emit(CartItemError(message: dioException.response!.statusMessage!));
  }catch (e) {

    emit(CartItemError(message: e.toString()));
  }
}

decreaeQuantityAPI({required String ItemId, required String qty}) async {

  try {
    final response = await cartRemoteDataSource.decreaseProduct(ItemId: ItemId,);
    print(response);
    emit(QuantityUpdated());

  }on NoInternetConnectionException {

    emit(NoInternetConnection());

  } on DioException catch (dioException) {

    emit(CartItemError(message: dioException.response!.statusMessage!));
  }catch (e) {

    emit(CartItemError(message: e.toString()));
  }
}

  clearCart() {
    cartItems.clear();
    cartItemsCount = 0;
    emit(CartItemDeletedSuccessfully());
  }
}
