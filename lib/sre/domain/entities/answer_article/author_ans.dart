import 'package:discy_application/sre/domain/entities/answer_article/badge_answer.dart';
import 'package:discy_application/sre/domain/entities/article/badge.dart';
import 'package:equatable/equatable.dart';

class AuthorAnswer extends Equatable {
  AuthorAnswer(
    this.id,
    this.name,
    this.avatar,
    this.verified,
    this.badge,
    this.profileCredential,
  );
  final int? id;
  final String? name;
  final String? avatar;
  bool? verified;
  final BadgeAnswer? badge;
  final String? profileCredential;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        id,
        name,
        avatar,
        verified,
        badge,
        profileCredential,
      ];

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "avatar": avatar,
        "verified": verified,
        "badge": badge!.toJson(),
        "profile_credential": profileCredential,
      };
}
