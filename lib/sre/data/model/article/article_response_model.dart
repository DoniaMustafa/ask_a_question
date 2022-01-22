import 'dart:convert';

import 'package:discy_application/sre/data/model/article/article_model.dart';
import 'package:discy_application/sre/domain/entities/article/article.dart';
import 'package:equatable/equatable.dart';

ArticleResponseModel articleResponseModel(String str) => ArticleResponseModel.fromJson(json.decode(str));

class ArticleResponseModel extends ResponseArticle{
  ArticleResponseModel(
      {bool? status,
      int? count,
      int? countTotal,
      int? pages,
      List<Article>? articleModel}) : super(status, count, countTotal, pages, articleModel);
  factory ArticleResponseModel.fromJson(Map<String, dynamic> json) =>
      ArticleResponseModel(
        status: json["status"],
        count: json["count"],
        countTotal: json["count_total"],
        pages: json["pages"],
        articleModel: List<ArticleModel>.from(
            json["posts"].map((x) => ArticleModel.fromJson(x))),
      );

}
class ResponseArticle extends Equatable{
  final bool? status;
  final int? count;
  final int? countTotal;
  final int? pages;
  final List<Article>? articleModel;
  @override
  // TODO: implement props
  List<Object?> get props => [this.status, this.count, this.countTotal, this.pages, this.articleModel];
  @override
  bool? get stringify => true;

  ResponseArticle(this.status, this.count, this.countTotal, this.pages, this.articleModel);

}
