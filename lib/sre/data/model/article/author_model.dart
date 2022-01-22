import 'package:discy_application/sre/data/model/article/author_badge_model.dart';
import 'package:discy_application/sre/domain/entities/article/author.dart';

class AuthorModel extends Author {
  AuthorModel(
      {final int? id,
        final String? name,
        final String? avatar,
        final  bool? verified,
        final AuthorBadgeModel? badge,
        final  String? profileCredential}) : super(id, name, avatar, verified, badge, profileCredential);
  factory AuthorModel.fromJson(Map<String, dynamic> json) => AuthorModel(
        id: json["id"],
        name: json["name"],
        avatar: json["avatar"],
        verified: json["verified"],
        badge: AuthorBadgeModel.fromJson(json["badge"]),
        profileCredential: json["profile_credential"],
      );
  //
  // AuthorModel(
  //     {this.id,
  //     this.name,
  //     this.avatar,
  //     this.verified,
  //     this.badge,
  //     this.profileCredential});

// Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "name": name,
  //   "avatar": avatar,
  //   "verified": verified,
  //   "badge": badge.toJson(),
  //   "profile_credential": profileCredential,
  // };

}
