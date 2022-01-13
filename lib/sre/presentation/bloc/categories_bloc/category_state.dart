part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}
class CategoryLoadingState extends CategoryState {}
class CategorySuccessState extends CategoryState {

 final CategoriesModel categoriesModel;

  CategorySuccessState({ required this.categoriesModel});

}
class CategoryErrorState extends CategoryState {
  final String error;

  CategoryErrorState({required this.error});
}
