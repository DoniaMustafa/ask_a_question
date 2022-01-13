import 'dart:convert';

import 'package:discy_application/sre/data/model/answer_article/comment_answer_model.dart';
import 'package:discy_application/sre/domain/entities/answer_article/author_ans.dart';
import 'package:discy_application/sre/domain/entities/answer_article/comment_answer.dart';
AnswerQuestionModel answerQuestionModelFromJson(String str) =>
    AnswerQuestionModel.fromJson(json.decode(str));

class AnswerQuestionModel  {
  AnswerQuestionModel({
    this.status,
    this.count,
    this.comments,
  });
  final bool? status;
  final int? count;
  final List<CommentAnswerModel>? comments;
  factory AnswerQuestionModel.fromJson(Map<String, dynamic> json) => AnswerQuestionModel(
    status: json["status"],
      count:json["count"],
    comments: List<CommentAnswerModel>.from(
        json["comments"].map((x) => CommentAnswerModel.fromJson(x))),
  );

}
