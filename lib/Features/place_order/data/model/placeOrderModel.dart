// To parse this JSON data, do
//
//     final placeOrderModel = placeOrderModelFromJson(jsonString);

import 'dart:convert';

PlaceOrderModel placeOrderModelFromJson(String str) => PlaceOrderModel.fromJson(json.decode(str));

String placeOrderModelToJson(PlaceOrderModel data) => json.encode(data.toJson());

class PlaceOrderModel {
  bool isSuccessful;
  bool hasContent;
  int code;
  dynamic message;
  dynamic detailedError;
  Data? data;

  PlaceOrderModel({
    required this.isSuccessful,
    required this.hasContent,
    required this.code,
    required this.message,
    required this.detailedError,
    required this.data,
  });

  factory PlaceOrderModel.fromJson(Map<String, dynamic> json) => PlaceOrderModel(
    isSuccessful: json["isSuccessful"],
    hasContent: json["hasContent"],
    code: json["code"],
    message: json["message"],
    detailedError: json["detailed_error"],
    data: json["data"] != null ? Data.fromJson(json["data"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "isSuccessful": isSuccessful,
    "hasContent": hasContent,
    "code": code,
    "message": message,
    "detailed_error": detailedError,
    "data": data?.toJson(),
  };
}

class Data {
  int id;
  dynamic externalId;
  String orderNumber;
  dynamic orderBill;
  int userId;
  dynamic billingId;
  dynamic shippingId;
  String billingAddress;
  String shippingAddress;
  dynamic couponId;
  String couponAmount;
  String heartsDiscount;
  String deliveryCharge;
  String subTotal;
  String tax;
  String grandTotal;
  int isFreeDelivery;
  int isOrderSuccessful;
  int isOrderCompleted;
  String paymentMethod;
  int paymentStatus;
  int orderStatus;
  String txn;
  dynamic tapPaymentMethodId;
  dynamic appId;
  dynamic cartToken;
  dynamic checkoutId;
  dynamic checkoutToken;
  dynamic cancelledAt;
  dynamic closedAt;
  dynamic name;
  dynamic number;
  dynamic orderStatusUrl;
  int cancelRequested;
  int returnRequested;
  dynamic cancelReason;
  dynamic returnReason;
  dynamic deliveryAt;
  DateTime createdAt;
  DateTime updatedAt;
  String sessionId;
  String sessionUrl;
  List<OrderDetail> orderDetails;
  User user;
  dynamic tapPaymentMethod;
  dynamic coupon;

  Data({
    required this.id,
    required this.externalId,
    required this.orderNumber,
    required this.orderBill,
    required this.userId,
    required this.billingId,
    required this.shippingId,
    required this.billingAddress,
    required this.shippingAddress,
    required this.couponId,
    required this.couponAmount,
    required this.heartsDiscount,
    required this.deliveryCharge,
    required this.subTotal,
    required this.tax,
    required this.grandTotal,
    required this.isFreeDelivery,
    required this.isOrderSuccessful,
    required this.isOrderCompleted,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.orderStatus,
    required this.txn,
    required this.tapPaymentMethodId,
    required this.appId,
    required this.cartToken,
    required this.checkoutId,
    required this.checkoutToken,
    required this.cancelledAt,
    required this.closedAt,
    required this.name,
    required this.number,
    required this.orderStatusUrl,
    required this.cancelRequested,
    required this.returnRequested,
    required this.cancelReason,
    required this.returnReason,
    required this.deliveryAt,
    required this.createdAt,
    required this.updatedAt,
    required this.sessionId,
    required this.sessionUrl,
    required this.orderDetails,
    required this.user,
    required this.tapPaymentMethod,
    required this.coupon,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    externalId: json["external_id"],
    orderNumber: json["Order_Number"],
    orderBill: json["order_bill"],
    userId: json["User_Id"],
    billingId: json["Billing_Id"],
    shippingId: json["Shipping_Id"],
    billingAddress: json["billing_address"],
    shippingAddress: json["shipping_address"],
    couponId: json["Coupon_Id"],
    couponAmount: json["Coupon_Amount"],
    heartsDiscount: json["hearts_discount"],
    deliveryCharge: json["Delivery_Charge"],
    subTotal: json["Sub_Total"],
    tax: json["Tax"],
    grandTotal: json["Grand_Total"],
    isFreeDelivery: json["Is_Free_Delivery"],
    isOrderSuccessful: json["Is_Order_Successful"],
    isOrderCompleted: json["Is_Order_Completed"],
    paymentMethod: json["Payment_Method"],
    paymentStatus: json["Payment_Status"],
    orderStatus: json["Order_Status"],
    txn: json["txn"],
    tapPaymentMethodId: json["tap_payment_method_id"],
    appId: json["app_id"],
    cartToken: json["cart_token"],
    checkoutId: json["checkout_id"],
    checkoutToken: json["checkout_token"],
    cancelledAt: json["cancelled_at"],
    closedAt: json["closed_at"],
    name: json["name"],
    number: json["number"],
    orderStatusUrl: json["order_status_url"],
    cancelRequested: json["cancel_requested"],
    returnRequested: json["return_requested"],
    cancelReason: json["cancel_reason"],
    returnReason: json["return_reason"],
    deliveryAt: json["Delivery_At"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    sessionId: json["session_id"],
    sessionUrl: json["session_url"],
    orderDetails: List<OrderDetail>.from(json["order_details"].map((x) => OrderDetail.fromJson(x))),
    user: User.fromJson(json["user"]),
    tapPaymentMethod: json["tap_payment_method"],
    coupon: json["coupon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "external_id": externalId,
    "Order_Number": orderNumber,
    "order_bill": orderBill,
    "User_Id": userId,
    "Billing_Id": billingId,
    "Shipping_Id": shippingId,
    "billing_address": billingAddress,
    "shipping_address": shippingAddress,
    "Coupon_Id": couponId,
    "Coupon_Amount": couponAmount,
    "hearts_discount": heartsDiscount,
    "Delivery_Charge": deliveryCharge,
    "Sub_Total": subTotal,
    "Tax": tax,
    "Grand_Total": grandTotal,
    "Is_Free_Delivery": isFreeDelivery,
    "Is_Order_Successful": isOrderSuccessful,
    "Is_Order_Completed": isOrderCompleted,
    "Payment_Method": paymentMethod,
    "Payment_Status": paymentStatus,
    "Order_Status": orderStatus,
    "txn": txn,
    "tap_payment_method_id": tapPaymentMethodId,
    "app_id": appId,
    "cart_token": cartToken,
    "checkout_id": checkoutId,
    "checkout_token": checkoutToken,
    "cancelled_at": cancelledAt,
    "closed_at": closedAt,
    "name": name,
    "number": number,
    "order_status_url": orderStatusUrl,
    "cancel_requested": cancelRequested,
    "return_requested": returnRequested,
    "cancel_reason": cancelReason,
    "return_reason": returnReason,
    "Delivery_At": deliveryAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "session_id": sessionId,
    "session_url": sessionUrl,
    "order_details": List<dynamic>.from(orderDetails.map((x) => x.toJson())),
    "user": user.toJson(),
    "tap_payment_method": tapPaymentMethod,
    "coupon": coupon,
  };
}

class OrderDetail {
  int id;
  dynamic externalId;
  dynamic sku;
  int orderId;
  int productId;
  dynamic variantId;
  String productName;
  dynamic variantName;
  dynamic image;
  dynamic size;
  dynamic color;
  String price;
  int quantity;
  String totalPrice;
  DateTime createdAt;
  DateTime updatedAt;
  String imageLink;

  OrderDetail({
    required this.id,
    required this.externalId,
    required this.sku,
    required this.orderId,
    required this.productId,
    required this.variantId,
    required this.productName,
    required this.variantName,
    required this.image,
    required this.size,
    required this.color,
    required this.price,
    required this.quantity,
    required this.totalPrice,
    required this.createdAt,
    required this.updatedAt,
    required this.imageLink,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
    id: json["id"],
    externalId: json["external_id"],
    sku: json["sku"],
    orderId: json["Order_Id"],
    productId: json["Product_Id"],
    variantId: json["Variant_Id"],
    productName: json["Product_Name"],
    variantName: json["Variant_Name"],
    image: json["Image"],
    size: json["Size"],
    color: json["Color"],
    price: json["Price"],
    quantity: json["Quantity"],
    totalPrice: json["Total_Price"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    imageLink: json["image_link"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "external_id": externalId,
    "sku": sku,
    "Order_Id": orderId,
    "Product_Id": productId,
    "Variant_Id": variantId,
    "Product_Name": productName,
    "Variant_Name": variantName,
    "Image": image,
    "Size": size,
    "Color": color,
    "Price": price,
    "Quantity": quantity,
    "Total_Price": totalPrice,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "image_link": imageLink,
  };
}

class User {
  int id;
  String name;
  dynamic description;
  String email;
  dynamic emailVerifiedAt;
  int isAdmin;
  dynamic image;
  DateTime createdAt;
  DateTime updatedAt;
  String lastname;
  int isVerfied;
  dynamic socialiteId;
  dynamic provider;

  User({
    required this.id,
    required this.name,
    required this.description,
    required this.email,
    required this.emailVerifiedAt,
    required this.isAdmin,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.lastname,
    required this.isVerfied,
    required this.socialiteId,
    required this.provider,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    isAdmin: json["is_admin"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    lastname: json["lastname"],
    isVerfied: json["is_verfied"],
    socialiteId: json["socialite_id"],
    provider: json["provider"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "is_admin": isAdmin,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "lastname": lastname,
    "is_verfied": isVerfied,
    "socialite_id": socialiteId,
    "provider": provider,
  };
}
