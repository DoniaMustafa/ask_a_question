import 'dart:convert';

import 'package:discy_application/sre/data/model/different_article/article_model.dart';

DifferentArticleResponseModel differentArticleResponseModel(String str) => DifferentArticleResponseModel.fromJson(json.decode(str));

class DifferentArticleResponseModel {
  final bool? status;
  final int? count;
  final int? countTotal;
  final int? pages;
  final List<DifferentArticleModel>? articleModel;

  DifferentArticleResponseModel(
      {this.status,
      this.count,
      this.countTotal,
      this.pages,
       this.articleModel});

  factory DifferentArticleResponseModel.fromJson(Map<String, dynamic> json) =>
      DifferentArticleResponseModel(
        status: json["status"],
        count: json["count"],
        countTotal: json["count_total"],
        pages: json["pages"],
        articleModel: List<DifferentArticleModel>.from(
            json["posts"].map((x) => DifferentArticleModel.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //   "status": status,
  //   "count": count,
  //   "count_total": countTotal,
  //   "pages": pages,
  //   "posts": List<dynamic>.from(articleModel.map((x) => x.toJson())),
  // };
}
