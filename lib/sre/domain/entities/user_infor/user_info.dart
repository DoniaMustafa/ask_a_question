import 'package:equatable/equatable.dart';

class UserInfo extends Equatable {
  UserInfo({
    this.id,
    this.username,
    this.email,
    this.url,
    this.displayName,
    this.description,
    this.avatar,
    this.cover,
    this.points,
    this.followers,
    this.userFollowers,
    this.questions,
    this.answers,
    this.bestAnswers,
    this.posts,
    this.comments,
    this.notifications,
    this.newNotifications,
    this.newMessages,
    this.verified,
    this.badge,
  });

  final int? id;
  final String? username;
  final String? email;
  final String? url;
  final String? displayName;
  final String? description;
  final String? avatar;
  final dynamic cover;
  final int? points;
  final int? followers;
  final List<dynamic>? userFollowers;
  final int? questions;
  final int? answers;
  final int? bestAnswers;
  final int? posts;
  final int? comments;
  final int? notifications;
  final int? newNotifications;
  final int? newMessages;
  final bool? verified;
  final Badge? badge;

  @override
  List<Object?> get props => [
        id,
        username,
        email,
        url,
        displayName,
        description,
        avatar,
        cover,
        points,
        followers,
        userFollowers,
        questions,
        answers,
        bestAnswers,
        posts,
        comments,
        notifications,
        newNotifications,
        newMessages,
        verified,
        badge,
      ];
  @override
  bool? get stringify => true;
}

class Badge extends Equatable {
  Badge({
    this.name,
    this.color,
  });

  final String? name;
  final String? color;

  @override
  List<Object?> get props => [name, color];
  @override
  bool? get stringify => true;
}
