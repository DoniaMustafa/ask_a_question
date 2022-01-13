import 'package:discy_application/sre/domain/entities/article/badge.dart';
import 'package:equatable/equatable.dart';

class CurrentUser extends Equatable {

  CurrentUser(
    this.id,
    this.username,
    this.email,
    this.avatar,
    this.cover,
    this.points,
    this.followers,
    this.questions,
    this.userFollowers,
    this.notifications,
    this.newNotifications,
    this.verified,
    this.badge,
);

  final int? id;
  final String? username;
  final String? email;
  final String? avatar;
  final dynamic cover;
  final int? points;
  final int? followers;
  final int? questions;

  final List<dynamic>? userFollowers;
  final int? notifications;
  final int? newNotifications;
  final bool? verified;
  final Badge? badge;

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        username,
        email,
        avatar,
        cover,
        points,
        followers,
    questions,
        userFollowers,
        notifications,
        newNotifications,
        verified,
        badge,
      ];

  @override
  // TODO: implement stringify
  bool? get stringify => true;
}
