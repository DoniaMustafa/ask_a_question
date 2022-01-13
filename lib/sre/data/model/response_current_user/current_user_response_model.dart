import 'dart:convert';

import 'package:discy_application/sre/data/model/response_current_user/current_user_model.dart';

ResponseCurrentUserModel responseCurrentUserModelFromJson(String str) => ResponseCurrentUserModel.fromJson(json.decode(str));


class ResponseCurrentUserModel {
  ResponseCurrentUserModel({
    this.status,
    this.user,
  });

  final bool? status;
  final CurrentUserModel? user;

  factory ResponseCurrentUserModel.fromJson(Map<String, dynamic> json) => ResponseCurrentUserModel(
    status: json["status"],
    user: CurrentUserModel.fromJson(json["user"]),
  );

}
