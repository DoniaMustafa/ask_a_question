
import 'dart:convert';

import 'package:discy_application/sre/data/model/answer_article/comment_answer_model.dart';
AnswerModel answerModelFromJson(String str) =>
    AnswerModel.fromJson(json.decode(str));

String answerModelToJson(AnswerModel data) => json.encode(data.toJson());

class AnswerModel {
  AnswerModel({
    this.status,
    this.count,
    this.countTotal,
    this.pages,
    this.comments,
  });

  final bool? status;
  final int? count;
  final String? countTotal;
  final int? pages;
  final List<CommentAnswerModel>? comments;

  factory AnswerModel.fromJson(Map<String, dynamic> json) => AnswerModel(
        status: json["status"],
        count: json["count"],
        countTotal: json["count_total"],
        pages: json["pages"],
        comments: List<CommentAnswerModel>.from(
            json["comments"].map((x) => CommentAnswerModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "count": count,
        "count_total": countTotal,
        "pages": pages,
        "comments": List<dynamic>.from(comments!.map((x) => x.toJson())),
      };
}

