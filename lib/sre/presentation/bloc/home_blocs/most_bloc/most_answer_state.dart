
import 'package:discy_application/sre/data/model/article/article_response_model.dart';

abstract class MostAnswerState{}
class MostAnswerInitial extends MostAnswerState{}

class MostAnswerLoadingStates extends MostAnswerState {}
class MostAnswerSuccessStates extends MostAnswerState {
  final ArticleResponseModel articleResponseModel;

  MostAnswerSuccessStates({required this.articleResponseModel});
}
class MostAnswerErrorStates extends MostAnswerState {
  final String error;

  MostAnswerErrorStates({required this.error});
}