import 'package:discy_application/sre/domain/entities/article/badge.dart';
import 'package:equatable/equatable.dart';

import 'different_badge.dart';

class DifferentAuthor extends Equatable {
  DifferentAuthor(
    this.id,
    this.name,
    this.avatar,
    this.verified,
    this.badge,
    this.profileCredential,
  );
  final int id;
  final String name;
  final String avatar;
   bool verified;
  final Badge badge;
  final String profileCredential;

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
}
