part of 'recent_ques_cubit.dart';

@immutable
abstract class RecentQuesState {}

class RecentQuesInitial extends RecentQuesState {}
class RecentQuestionLoadingStates extends RecentQuesState {}

class RecentQuestionSuccessStates extends RecentQuesState {
 final ArticleResponseModel articleResponseModel;
 final List<Article> article;

  RecentQuestionSuccessStates({required this.articleResponseModel,required this.article});
}
class RecentQuestionErrorStates extends RecentQuesState {
  final String error;

  RecentQuestionErrorStates({required this.error});
}
class MoreRecentQuestionLoadingStates extends RecentQuesState {}
class MoreRecentQuestionSuccessStates extends RecentQuesState {}
class MoreRecentQuestionErrorStates extends RecentQuesState {}