import 'package:discy_application/sre/domain/entities/article/badge.dart';
import 'package:equatable/equatable.dart';

class Author extends Equatable {
  Author(
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
  final Badge? badge;
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
}
