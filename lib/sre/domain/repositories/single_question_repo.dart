import 'package:dio/dio.dart';
import 'package:discy_application/sre/data/model/model.dart';
import 'package:flutter/cupertino.dart';

abstract class SingleQuestionRepository{
  Future<Response>getSinglePost({required int id,required String postType});
Future<Response>getAnswerQuestion({required int id,required String posType});
}