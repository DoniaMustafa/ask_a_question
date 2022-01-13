// To parse this JSON data, do
//
//     final singleQuestionmodel = singleQuestionmodelFromJson(jsonString);

import 'dart:convert';

import 'package:discy_application/sre/domain/entities/settings/notify.dart';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
  NotificationModel({
    this.status,
    this.count,
    this.countTotal,
    this.pages,
    this.notifications,
  });

  final bool? status;
  final String? count;
  final int? countTotal;
  final int? pages;
  final List<NotifyData>? notifications;

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    status: json["status"],
    count: json["count"],
    countTotal: json["count_total"],
    pages: json["pages"],
    notifications: List<NotifyData>.from(json["notifications"].map((x) => NotifyData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "count": count,
    "count_total": countTotal,
    "pages": pages,
    "notifications": List<dynamic>.from(notifications!.map((x) => x.toJson())),
  };
}

class NotifyData extends Notify{
  NotifyData(
      {
     required int id,
     required String title,
     required String icon,
     required String color,
     required String type,
     required String text,
     required String date,
     required bool json}) : super(id, title, icon, color, type, text, date, json);

  // NotifyData({
  //   this.id,
  //   this.title,
  //   this.icon,
  //   this.color,
  //   this.type,
  //   this.text,
  //   this.date,
  //   this.json,
  // });
  //
  // final int? id;
  // final String? title;
  // final String? icon;
  // final String? color;
  // final String? type;
  // final String? text;
  // final String? date;
  // final bool? json;
  //
  factory NotifyData.fromJson(Map<String, dynamic> json) => NotifyData(
    id: json["id"],
    title: json["title"],
    icon: json["icon"],
    color: json["color"],
    type: json["type"],
    text: json["text"],
    date: json["date"],
    json: json["json"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "icon": icon,
    "color": color,
    "type": type,
    "text": text,
    "date": date,
    "json": json,
  };
}
