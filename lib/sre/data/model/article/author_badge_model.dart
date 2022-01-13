import 'package:discy_application/sre/domain/entities/answer_article/badge_answer.dart';
import 'package:discy_application/sre/domain/entities/article/badge.dart';
import 'package:discy_application/sre/domain/entities/different_article/different_badge.dart';

class AuthorBadgeModel extends Badge {
  AuthorBadgeModel({required this.name, required this.color})
      : super(name, color);
  final String name;
  final String color;
  factory AuthorBadgeModel.fromJson(Map<String, dynamic> json) =>
      AuthorBadgeModel(
        name: json["name"],
        color: json["color"],
      );
  // Map<String, dynamic> toJson() => {
  //       "name": name,
  //       "color": color,
  //     };
}
