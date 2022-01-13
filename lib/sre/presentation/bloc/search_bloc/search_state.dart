part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}
class SearchLoading extends SearchState {}
class SearchSuccess extends SearchState {
  final ArticleResponseModel? articleModel;

  SearchSuccess(this.articleModel);
}
class SearchError extends SearchState {}
