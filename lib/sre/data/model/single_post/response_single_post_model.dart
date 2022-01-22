// To parse this JSON data, do
//
//     final singleQuestionmodel = singleQuestionmodelFromJson(jsonString);

import 'dart:convert';

import 'package:discy_application/sre/data/model/single_post/single_post_model.dart';

ResponseSingleQuestionModel singleQuestionModelFromJson(String str) =>
    ResponseSingleQuestionModel.fromJson(json.decode(str));

class ResponseSingleQuestionModel {
  ResponseSingleQuestionModel({
    this.post,
  });

  final SingleQuestionPostModel? post;

  factory ResponseSingleQuestionModel.fromJson(Map<String, dynamic> json) =>
      ResponseSingleQuestionModel(
        post: SingleQuestionPostModel.fromJson(json["post"]),
      );
}

