import 'package:dio/dio.dart';
import 'package:discy_application/sre/core/resources/data_state.dart';

abstract class DioServerRepos {
  Future<Response> call({required String path, Map<String, dynamic> query});
  Future<Response> callPost({required String path, Map<String, dynamic> data});

}
