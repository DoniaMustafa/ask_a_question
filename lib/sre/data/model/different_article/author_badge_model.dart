import 'package:discy_application/sre/domain/entities/answer_article/badge_answer.dart';
import 'package:discy_application/sre/domain/entities/article/badge.dart';

class DifferentAuthorBadgeModel extends Badge {
  DifferentAuthorBadgeModel({required this.name, required this.color})
      : super(name, color);
  final String name;
  final String color;
  factory DifferentAuthorBadgeModel.fromJson(Map<String, dynamic> json) =>
      DifferentAuthorBadgeModel(
        name: json["name"],
        color: json["color"],
      );
  // Map<String, dynamic> toJson() => {
  //       "name": name,
  //       "color": color,
  //     };
}
