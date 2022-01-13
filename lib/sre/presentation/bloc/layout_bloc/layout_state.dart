part of 'layout_cubit.dart';

@immutable
abstract class LayoutState {}

class LayoutInitialState extends LayoutState {}

class ChangeItemInitialStates extends LayoutState {}
class ChangeItemOfBottomBarStates extends LayoutState {}

class LayoutRecentQuestionLoadingStates extends LayoutState {}

class LayoutRecentQuestionSuccessStates extends LayoutState {
  final  ArticleResponseModel articleResponseModel;

  LayoutRecentQuestionSuccessStates({required this.articleResponseModel});
}

class LayoutRecentQuestionErrorStates extends LayoutState {
  final String error;

  LayoutRecentQuestionErrorStates({required this.error});
}
