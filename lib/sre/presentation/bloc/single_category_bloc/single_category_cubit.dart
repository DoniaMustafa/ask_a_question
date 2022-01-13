import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:discy_application/sre/data/model/article/article_model.dart';
import 'package:discy_application/sre/data/model/article/article_response_model.dart';
import 'package:discy_application/sre/data/model/single_catigory/single_catigory_model.dart';
import 'package:discy_application/sre/domain/repositories/category_repo.dart';
import 'package:meta/meta.dart';

part 'single_category_state.dart';

class SingleCategoryCubit extends Cubit<SingleCategoryState> {
  SingleCategoryCubit(this._categoryRepository)
      : super(SingleCategoryInitial());
  CategoryRepository _categoryRepository;
   ArticleResponseModel? articleModel;
   SingleCategoryModel? singleCategory;
  Future<Response?> getSingleCategory({required int id}) async {
    emit(SingleCategoryLoadingState());
    return await _categoryRepository
        .getSingleCategory(id: id)
        .then((value) {
      singleCategory=singleCategoryModel(value.toString());
      print(singleCategory);
      articleModel=articleResponseModel(value.toString());
      emit(SingleCategorySuccessState(articleResponseModel: articleModel!));
    }).catchError((error) {
      emit(SingleCategoryErrorState(error: error.toString()));
    });
  }
}
