import 'package:equatable/equatable.dart';

class DifferentCustomFields extends Equatable {
  final List<String>? postStats;
  final List<String>? commentCount;
  final List<String>? questionVote;
  DifferentCustomFields( this.postStats, this.commentCount,this.questionVote);

  @override
  // TODO: implement props
  List<Object?> get props => [postStats, commentCount,questionVote];
  bool? get stringify => true;
}
