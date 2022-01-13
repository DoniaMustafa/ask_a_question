// To parse this JSON data, do
//
//     final singleQuestionmodel = singleQuestionmodelFromJson(jsonString);

import 'dart:convert';

import 'package:discy_application/sre/domain/entities/faq.dart';

FaqModel faqModelFromJson(String str) => FaqModel.fromJson(json.decode(str));

String faqModelToJson(FaqModel data) => json.encode(data.toJson());

class FaqModel {
  FaqModel({
    this.status,
  required this.faqs,
  });

  final bool? status;
  final List<FaqDataModel> faqs;

  factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
    status: json["status"],
    faqs: List<FaqDataModel>.from(json["faqs"].map((x) => FaqDataModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "faqs": List<dynamic>.from(faqs.map((x) => x.toJson())),
  };
}

class FaqDataModel extends FAQ {
  FaqDataModel({required String question,required String answer}) : super(question, answer);

factory FaqDataModel.fromJson(Map<String, dynamic> json) => FaqDataModel(
  question: json["text"],
  answer: json["textarea"],
  );
  Map<String, dynamic> toJson() => {
    "text": question,
    "textarea": answer,
  };
}
