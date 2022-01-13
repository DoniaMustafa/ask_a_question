part of 'no_answer__qus_cubit.dart';

@immutable
abstract class NoAnswerQusState {}

class NoAnswerQusInitial extends NoAnswerQusState {}
class  NoAnswerLoadingState extends NoAnswerQusState {}
class  NoAnswerSuccessState extends NoAnswerQusState { final ArticleResponseModel? articleModel;
NoAnswerSuccessState({required this.articleModel});
}
class  NoAnswerErrorState extends NoAnswerQusState {
  final String ? error;
  NoAnswerErrorState({required this.error});

}
