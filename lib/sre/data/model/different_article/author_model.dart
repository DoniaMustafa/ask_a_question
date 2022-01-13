import 'package:discy_application/sre/data/model/article/author_badge_model.dart';
import 'package:discy_application/sre/domain/entities/article/author.dart';
import 'package:discy_application/sre/domain/entities/different_article/different_author.dart';

class DifferentAuthorModel extends DifferentAuthor {
  DifferentAuthorModel(
      {required int id,
        required String name,
        required String avatar,
        required  bool verified,
        required  AuthorBadgeModel badge,
        required String profileCredential})
      : super(id, name, avatar, verified, badge, profileCredential);
  factory DifferentAuthorModel.fromJson(Map<String, dynamic> json) => DifferentAuthorModel(
    id: json["id"],

    name: json["name"],
    avatar: json["avatar"],
    verified: json["verified"],
    badge: AuthorBadgeModel.fromJson(json["badge"]),
    profileCredential: json["profile_credential"],
  );

  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "name": name,
  //   "avatar": avatar,
  //   "verified": verified,
  //   "badge": badge.toJson(),
  //   "profile_credential": profileCredential,
  // };



}
