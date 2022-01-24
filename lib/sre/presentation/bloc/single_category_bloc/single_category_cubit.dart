import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:discy_application/sre/data/model/article/article_model.dart';
import 'package:discy_application/sre/data/model/article/article_response_model.dart';
import 'package:discy_application/sre/data/model/single_catigory/single_category.dart';
import 'package:discy_application/sre/domain/entities/article/article.dart';
import 'package:discy_application/sre/domain/repositories/category_repo.dart';
import 'package:meta/meta.dart';

part 'single_category_state.dart';

class SingleCategoryCubit extends Cubit<SingleCategoryState> {
  SingleCategoryCubit(this._categoryRepository)
      : super(SingleCategoryInitial());
  CategoryRepository _categoryRepository;
   List<ArticleModel>? articleModel;
  SingleCategoryModel? singleCategory;
 getSingleCategory({required int id})  {
   print('f');
    emit(SingleCategoryLoadingState());
    return  _categoryRepository
        .getSingleCategory(id: id)
        .then((value) {
      singleCategory=singleCategoryModelFromJson(value.toString());
      print(value.data);
      print(singleCategory);

      articleModel=singleCategory!.posts!;
      emit(SingleCategorySuccessState(articleResponseModel: articleModel!));
    }).catchError((error) {
      print(error.toString());

      emit(SingleCategoryErrorState(error: error.toString()));
    });
  }
}
