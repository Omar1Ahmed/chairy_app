// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  bool isSuccessful;
  bool hasContent;
  int? code;
  String? message;
  dynamic detailedError;
  Data? data;

  AuthModel({
    required this.isSuccessful,
    required this.hasContent,
    required this.code,
    required this.message,
    required this.detailedError,
    required this.data,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    isSuccessful: json["isSuccessful"],
    hasContent: json["hasContent"],
    code: json["code"],
    message: json["message"]!= null ? json["message"] : null,
    detailedError: json["detailed_error"],
    data: json["data"] != null ? Data.fromJson(json["data"]) : null,);

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
  String name;
  String lastname;
  String email;
  DateTime updatedAt;
  DateTime createdAt;
  int id;
  int isVerfied;
  String token;

  Data({
    required this.name,
    required this.lastname,
    required this.email,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.isVerfied,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    lastname: json["lastname"],
    email: json["email"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
    isVerfied: json["is_verfied"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "lastname": lastname,
    "email": email,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
    "is_verfied": isVerfied,
    "token": token,
  };
}
