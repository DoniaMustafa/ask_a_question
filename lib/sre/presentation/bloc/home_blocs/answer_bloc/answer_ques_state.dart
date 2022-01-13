part of 'answer_ques_cubit.dart';

@immutable
abstract class AnswerQuesState {}

class AnswerQuesInitial extends AnswerQuesState {}

class AnswerQuesLoadingStates extends AnswerQuesState {}

class AnswerQuesSuccessStates extends AnswerQuesState {
  final AnswerModel answerModel;
final List<CommentAnswerModel> commentModel;
  AnswerQuesSuccessStates({required this.answerModel,required this.commentModel});
}

class AnswerQuesErrorStates extends AnswerQuesState {
  final String error;

  AnswerQuesErrorStates({required this.error});
}
