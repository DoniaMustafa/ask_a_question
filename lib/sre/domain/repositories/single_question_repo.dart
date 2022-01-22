import 'package:dio/dio.dart';

abstract class SingleQuestionRepository{
  Future<Response>getSinglePost({required int id,required String postType});
Future<Response>getAnswerQuestion({required int id,required String posType});
}