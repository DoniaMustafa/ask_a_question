import 'dart:convert';

import 'package:discy_application/sre/data/model/article/caregory_model.dart';



CategoriesModel categoryModelFromJson(String str) =>
    CategoriesModel.fromJson(json.decode(str));


class CategoriesModel {
  CategoriesModel({
    this.categories,
  });

  final List<CategoryModel>? categories;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        categories: List<CategoryModel>.from(
            json["categories"].map((x) => CategoryModel.fromJson(x))),
      );


}
