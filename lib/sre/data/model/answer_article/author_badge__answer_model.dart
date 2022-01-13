import 'package:discy_application/sre/domain/entities/answer_article/badge_answer.dart';
import 'package:discy_application/sre/domain/entities/article/badge.dart';

class AuthorBadgeAnswerModel extends BadgeAnswer {
  AuthorBadgeAnswerModel({required this.name, required this.color})
      : super(name, color);
  final String name;
  final String color;
  factory AuthorBadgeAnswerModel.fromJson(Map<String, dynamic> json) =>
      AuthorBadgeAnswerModel(
        name: json["name"],
        color: json["color"],
      );
  Map<String, dynamic> toJson() => {
        "name": name,
        "color": color,
      };
}
