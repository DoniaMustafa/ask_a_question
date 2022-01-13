import 'package:discy_application/sre/domain/entities/article/custom_fields.dart';
import 'package:discy_application/sre/domain/entities/different_article/different_custom_fields.dart';

class DifferentCustomFieldsModel extends DifferentCustomFields {
  DifferentCustomFieldsModel(
      { List<String>? postStats,
       List<String>? commentCount,
        required List<String> questionVote,})
      : super(postStats, commentCount,questionVote);

  factory DifferentCustomFieldsModel.fromJson(Map<String, dynamic> json) =>
      DifferentCustomFieldsModel(
        postStats: List<String>.from(json["post_stats"].map((x) => x)),
        commentCount: List<String>.from(json["comment_count"].map((x) => x)),

        questionVote: List<String>.from(json["question_vote"].map((x) => x)),

      );
}
