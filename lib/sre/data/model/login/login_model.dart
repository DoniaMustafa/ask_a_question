// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

import 'package:discy_application/sre/data/model/article/author_badge_model.dart';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));


class LoginModel {
  LoginModel({
    this.status,
    this.success,
    this.token,
    this.user,
  });

  final bool? status;
  final bool? success;
  final String? token;
  final User? user;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    success: json["success"],
    token: json["token"],
    user: User.fromJson(json["user"]),
  );
}

class User {
  User({
    this.id,
    this.username,
    this.email,
    this.displayName,
    this.avatar,
    this.verified,
    this.badge,
  });

  final int? id;
  final String? username;
  final String? email;
  final String? displayName;
  final String? avatar;
  final bool? verified;
  final AuthorBadgeModel? badge;


  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    displayName: json["displayname"],
    avatar: json["avatar"],
    verified: json["verified"],
    badge: AuthorBadgeModel.fromJson(json["badge"]),
  );


}

