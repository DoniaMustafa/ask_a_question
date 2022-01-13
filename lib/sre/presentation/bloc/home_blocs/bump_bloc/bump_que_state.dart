part of 'bump_que_cubit.dart';

@immutable
abstract class BumpQueState {}

class BumpQueInitial extends BumpQueState {}
class BumpQueLoadingState extends BumpQueState {}
class MoreBumpQueLoadingState extends BumpQueState {}

class BumpQueSuccessState extends BumpQueState {
 final ArticleResponseModel articleResponseModel;
 final List<Article>article;

  BumpQueSuccessState({required this.articleResponseModel,required this.article});
}
class BumpQueErrorState extends BumpQueState {
  final String error;
  BumpQueErrorState({ required this.error});
}
