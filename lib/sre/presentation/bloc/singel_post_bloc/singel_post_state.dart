part of 'singel_post_cubit.dart';

@immutable
abstract class SinglePostState {}

class SinglePostInitial extends SinglePostState {}
class SinglePostLoadingState extends SinglePostState {}
class SinglePostSuccessState extends SinglePostState {
  final SingleQuestionPostModel singleQuestionModel;

  SinglePostSuccessState({required this.singleQuestionModel});
}
class SinglePostErrorState extends SinglePostState {
  final String error;

  SinglePostErrorState({required this.error});
}
class SinglePostAnswerLoadingState extends SinglePostState {}
class SinglePostAnswerSuccessState extends SinglePostState {
  final AnswerQuestionModel answerModel;

  SinglePostAnswerSuccessState({required this.answerModel});
}
class SinglePostAnswerErrorState extends SinglePostState {
  final String error;

  SinglePostAnswerErrorState({required this.error});
}
