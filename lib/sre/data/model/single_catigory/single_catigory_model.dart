import 'dart:convert';

import 'package:discy_application/sre/data/model/single_catigory/details_single_catigory_model.dart';
SingleCategoryModel singleCategoryModel (String str)=>SingleCategoryModel.fromJson(json.decode(str));
class SingleCategoryModel{

  DetailsSingleCategoryModel detailsSingleCategoryModel;

  SingleCategoryModel({required this.detailsSingleCategoryModel});

  factory SingleCategoryModel.fromJson(Map<String, dynamic> json) => SingleCategoryModel(
    detailsSingleCategoryModel: DetailsSingleCategoryModel.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "category": detailsSingleCategoryModel.toJson(),
  };
}

