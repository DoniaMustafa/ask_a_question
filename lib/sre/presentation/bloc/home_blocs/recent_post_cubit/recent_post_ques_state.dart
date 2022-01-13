part of 'recent_post_ques_cubit.dart';

@immutable
abstract class RecentPostQuesState {}

class RecentPostQuesInitial extends RecentPostQuesState {}

class RecentPostLoadingState extends RecentPostQuesState {}

class RecentPostSuccessState extends RecentPostQuesState {
  final DifferentArticleResponseModel? articleModel;
  RecentPostSuccessState({required this.articleModel});
}

class RecentPostErrorState extends RecentPostQuesState {
  final String? error;
  RecentPostErrorState({required this.error});
}
