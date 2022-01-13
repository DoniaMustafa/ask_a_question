import 'package:discy_application/sre/data/model/article/author_badge_model.dart';
import 'package:discy_application/sre/domain/entities/article/badge.dart';
import 'package:discy_application/sre/domain/entities/current_user.dart';

class CurrentUserModel extends CurrentUser {
  CurrentUserModel({
    int? id,
    String? username,
    String? email,
    String? avatar,
    cover,
    int? points,
    int? followers,
    List? userFollowers,
    int? notifications,
    int? questions,
    int? newNotifications,
    bool? verified,
    AuthorBadgeModel? badge})
      : super(id, username, email, avatar, cover, points, followers,questions,
            userFollowers, notifications, newNotifications, verified, badge);

  factory CurrentUserModel.fromJson(Map<String, dynamic> json) => CurrentUserModel(
  id: json["id"],
  username: json["username"],
  email: json["email"],
  avatar: json["avatar"],
  cover: json["cover"],
  points: json["points"],
  followers: json["followers"],
      questions:json["questions"],
  userFollowers: List<dynamic>.from(json["user_followers"].map((x) => x)),
  notifications: json["notifications"],
  newNotifications: json["new_notifications"],
  verified: json["verified"],
  badge: AuthorBadgeModel.fromJson(json["badge"]));

}
