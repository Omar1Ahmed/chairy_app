import 'dart:convert';

import '../../domain/entity/CategoryEntity.dart' show CategoryEntity;

CategoriesModel categoriesModelFromJson(String str) => CategoriesModel.fromJson(json.decode(str));

class CategoriesModel {
  bool isSuccessful;
  bool hasContent;
  int code;
  dynamic message;
  dynamic detailedError;
  List<CategoryEntity> data;

  CategoriesModel({
    required this.isSuccessful,
    required this.hasContent,
    required this.code,
    required this.message,
    required this.detailedError,
    required this.data,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
    isSuccessful: json["isSuccessful"],
    hasContent: json["hasContent"],
    code: json["code"],
    message: json["message"],
    detailedError: json["detailed_error"],
    data: List<CategoryEntity>.from(json["data"].map((x) => CategoryEntity.fromJson(x))),
  );




  List<CategoryEntity> toEntities() => data.map((e) => e.toEntity()).toList();
}


