import 'package:equatable/equatable.dart';

class CustomFields extends Equatable {
  final List<String>? postStats;
  final List<String>? commentCount;
  final List<String>? questionVote;
  CustomFields(this.postStats, this.commentCount, this.questionVote);

  @override
  List<Object?> get props => [postStats, commentCount, questionVote];

  @override
  bool? get stringify => true;
}
