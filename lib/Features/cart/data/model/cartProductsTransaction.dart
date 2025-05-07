// To parse this JSON data, do
//
//     final cartProductTransactionsModel = cartProductTransactionsModelFromJson(jsonString);

import 'dart:convert';

CartProductTransactionsModel cartProductTransactionsModelFromJson(String str) => CartProductTransactionsModel.fromJson(json.decode(str));

String cartProductTransactionsModelToJson(CartProductTransactionsModel data) => json.encode(data.toJson());

class CartProductTransactionsModel {
  bool? isSuccessful;
  bool? hasContent;
  int? code;
  dynamic message;
  dynamic detailedError;
  Data? data;

  CartProductTransactionsModel({
    this.isSuccessful,
    this.hasContent,
    this.code,
    this.message,
    this.detailedError,
    this.data,
  });

  factory CartProductTransactionsModel.fromJson(Map<String, dynamic> json) => CartProductTransactionsModel(
    isSuccessful: json["isSuccessful"],
    hasContent: json["hasContent"],
    code: json["code"],
    message: json["message"],
    detailedError: json["detailed_error"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
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
  List<CartItem>? cartItems;

  Data({
    this.cartItems,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    cartItems: json["cart_items"] == null ? [] : List<CartItem>.from(json["cart_items"]!.map((x) => CartItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cart_items": cartItems == null ? [] : List<dynamic>.from(cartItems!.map((x) => x.toJson())),
  };
}

class CartItem {
  String? rowId;
  int? id;
  String? name;
  int? qty;
  int? price;
  int? weight;
  Options? options;
  int? discount;
  int? tax;
  int? subtotal;

  CartItem({
    this.rowId,
    this.id,
    this.name,
    this.qty,
    this.price,
    this.weight,
    this.options,
    this.discount,
    this.tax,
    this.subtotal,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    rowId: json["rowId"],
    id: json["id"],
    name: json["name"],
    qty: json["qty"] is int ? json["qty"] : int.tryParse(json["qty"].toString()),
    price: json["price"],
    weight: json["weight"],
    options: json["options"] == null ? null : Options.fromJson(json["options"]),
    discount: json["discount"],
    tax: json["tax"],
    subtotal: json["subtotal"],
  );

  Map<String, dynamic> toJson() => {
    "rowId": rowId,
    "id": id,
    "name": name,
    "qty": qty,
    "price": price,
    "weight": weight,
    "options": options?.toJson(),
    "discount": discount,
    "tax": tax,
    "subtotal": subtotal,
  };
}

class Options {
  dynamic sku;
  String? name;
  dynamic size;
  dynamic color;
  String? discountPrice;
  String? discountParcent;
  dynamic variantId;
  dynamic variantName;

  Options({
    this.sku,
    this.name,
    this.size,
    this.color,
    this.discountPrice,
    this.discountParcent,
    this.variantId,
    this.variantName,
  });

  factory Options.fromJson(Map<String, dynamic> json) => Options(
    sku: json["sku"],
    name: json["name"],
    size: json["size"],
    color: json["color"],
    discountPrice: json["discount_price"],
    discountParcent: json["discount_parcent"],
    variantId: json["variant_id"],
    variantName: json["variant_name"],
  );

  Map<String, dynamic> toJson() => {
    "sku": sku,
    "name": name,
    "size": size,
    "color": color,
    "discount_price": discountPrice,
    "discount_parcent": discountParcent,
    "variant_id": variantId,
    "variant_name": variantName,
  };
}
