import 'dart:convert';

import 'package:discy_application/sre/data/model/article/article_model.dart';
import 'package:discy_application/sre/data/model/article/tags_model.dart';

ResponseTagModel responseTagModel(String str)=>ResponseTagModel.fromJson(json.decode(str));

class ResponseTagModel{
  final bool? status ;
  final int? count;
  final int? countTotal;
  final int? pages;
  TagsModel? tags;
  List<ArticleModel>? article;

  ResponseTagModel(
      {this.status,
      this.count,
      this.countTotal,
      this.pages,
      this.tags,
      this.article});

  factory ResponseTagModel.fromJson(Map<String, dynamic> json) => ResponseTagModel(
    status: json["status"],
    count: json["count"],
    countTotal: json["count_total"],
    pages: json["pages"],
    tags: TagsModel.fromJson(json["i_tag"]),
    article: List<ArticleModel>.from(json["posts"].map((x) => ArticleModel.fromJson(x))),
  );



}