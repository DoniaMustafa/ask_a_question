import 'package:dio/dio.dart';
import 'package:discy_application/sre/core/usecases/usecase.dart';
import 'package:discy_application/sre/core/utils/end_point.dart';
import 'package:discy_application/sre/domain/repositories/category_repo.dart';

class CategoryImplement implements CategoryRepository{
  UseCase? _dioServerRepos;
  CategoryImplement(this._dioServerRepos);


  @override
  Future<Response> getCategories()async {
    return await _dioServerRepos!.call(path: kCategoryIndex,query: {
      'taxonomy':kQuestionCategory,
      'page':0
    });

  }
  @override
  Future<Response> getSingleCategory({required int id})async {
    return await _dioServerRepos!.call(path: kCategoryPost,query: {
      'taxonomy':kQuestionCategory,
      'id':id
    });
  }
}