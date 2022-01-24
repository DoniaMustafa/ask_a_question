import 'package:dio/dio.dart';

abstract class TagsRepository{
  Future<Response>getSingleTags({required int id,required String taxonomy});
}