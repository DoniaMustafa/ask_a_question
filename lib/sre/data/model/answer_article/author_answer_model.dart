import 'package:discy_application/sre/domain/entities/answer_article/author_ans.dart';
import 'package:discy_application/sre/domain/entities/answer_article/badge_answer.dart';

import 'author_badge__answer_model.dart';

class AuthorAnswerModel extends AuthorAnswer {
  AuthorAnswerModel(
      {required int? id,
      required String? name,
      required String? avatar,
      required bool? verified,
      required AuthorBadgeAnswerModel? badge,
      required String? profileCredential})
      : super(id, name, avatar, verified, badge, profileCredential);
  //
  factory AuthorAnswerModel.fromJson(Map<String, dynamic> json) => AuthorAnswerModel(
        id: json["id"],
        name: json["name"],
        avatar: json["avatar"],
        verified: json["verified"],
        badge: AuthorBadgeAnswerModel.fromJson(json["badge"]),
        profileCredential: json["profile_credential"],
      );


}
