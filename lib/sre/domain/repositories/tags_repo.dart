import 'package:dio/dio.dart';
import 'package:discy_application/sre/data/model/article/article_response_model.dart';

abstract class TagsRepository{
  Future<Response>getSingleTags({required int id,required String taxonomy});
}