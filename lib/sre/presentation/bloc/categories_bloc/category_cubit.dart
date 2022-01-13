import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:discy_application/sre/data/model/categories/categories_model.dart';
import 'package:discy_application/sre/domain/repositories/category_repo.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this._categoryRepository) : super(CategoryInitial());
  CategoryRepository _categoryRepository;
  CategoriesModel? _categoriesModel;



  Future<Response?> getCategories() async {
    emit(CategoryLoadingState());
    return await _categoryRepository.getCategories().then((value) {
      _categoriesModel =categoryModelFromJson(value.toString());
      print(' categories:  $_categoriesModel');
      emit(CategorySuccessState(categoriesModel: _categoriesModel!));
    }).catchError((error) {
      print(error.toString());
      emit(CategoryErrorState(error: error.toString()));
    });
  }
}
