import 'dart:convert';

import 'package:discy_application/sre/data/model/article/article_model.dart';
import 'package:discy_application/sre/data/model/article/caregory_model.dart';
import 'package:discy_application/sre/domain/entities/article/article.dart';

SingleCategoryModel singleCategoryModelFromJson(String str) => SingleCategoryModel.fromJson(json.decode(str));

// String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class SingleCategoryModel {
    SingleCategoryModel(   {
        this.status,
        this.count,
        this.countTotal,
        this.pages,
        this.category,
        this.posts,
  });

    final bool? status;
    final int? count;
    final int? countTotal;
    final int? pages;
    final CategoryModel? category;
    final List<ArticleModel>? posts;

    factory SingleCategoryModel.fromJson(Map<String, dynamic> json) => SingleCategoryModel(
        status: json["status"],
        count: json["count"],
        countTotal: json["count_total"],
        pages: json["pages"],
        category: CategoryModel.fromJson(json["i_category"]),
        posts: List<ArticleModel>.from(json["posts"].map((x) => ArticleModel.fromJson(x))),
    );

   }