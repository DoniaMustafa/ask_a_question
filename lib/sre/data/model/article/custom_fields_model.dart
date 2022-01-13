import 'package:discy_application/sre/domain/entities/article/custom_fields.dart';

class CustomFieldsModel extends CustomFields {
  CustomFieldsModel(
      { List<String>? postStats,
       List<String>? commentCount,
        required List<String> questionVote,})
      : super(postStats, commentCount,questionVote);

  factory CustomFieldsModel.fromJson(Map<String, dynamic> json) =>
      CustomFieldsModel(
        postStats: List<String>.from(json["post_stats"].map((x) => x)),
        commentCount: List<String>.from(json["comment_count"].map((x) => x)),

        questionVote: List<String>.from(json["question_vote"].map((x) => x)),

      );
}
