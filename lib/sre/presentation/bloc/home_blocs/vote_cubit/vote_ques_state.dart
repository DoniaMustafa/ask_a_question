part of 'vote_ques_cubit.dart';

@immutable
abstract class MostVoteState {}

class MostVoteInitial extends MostVoteState {}
class MostVoteLoadingState extends MostVoteState {}
class MostVoteSuccessState extends MostVoteState {
 final ArticleResponseModel? articleModel;
 MostVoteSuccessState({required this.articleModel});

}
class MostVoteErrorState extends MostVoteState {

  final String ? error;
  MostVoteErrorState({required this.error});
}