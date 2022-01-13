import 'package:dio/dio.dart';

abstract class ActionRepository{
  Future<Response> postGetVoteOfArticle({required int id,required String type,required String action});


}