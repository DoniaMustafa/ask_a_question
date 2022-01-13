import 'package:dio/dio.dart';

abstract class SearchRepository{
  Future<Response>getSearch({required String text});

}