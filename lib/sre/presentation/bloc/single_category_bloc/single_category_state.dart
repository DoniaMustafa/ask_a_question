part of 'single_category_cubit.dart';

@immutable
abstract class SingleCategoryState {}

class SingleCategoryInitial extends SingleCategoryState {}
class SingleCategoryLoadingState extends SingleCategoryState {}
class SingleCategorySuccessState extends SingleCategoryState {
final  ArticleResponseModel? articleResponseModel;

SingleCategorySuccessState({required this.articleResponseModel});
}
class SingleCategoryErrorState extends SingleCategoryState {
  final String error;

  SingleCategoryErrorState({required this.error});
}
