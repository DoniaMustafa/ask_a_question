import 'package:dio/dio.dart';
import 'package:discy_application/sre/core/parameters/api_request..dart';
import 'package:discy_application/sre/core/resources/data_state.dart';
import 'package:discy_application/sre/data/datasource/remote/dio_server.dart';
import 'package:discy_application/sre/domain/entities/article/article.dart';

abstract class UseCase{
  Future call({required String path, Map<String, dynamic> query});
  Future callPost({required String path, Map<String, dynamic> data});

}

class DataUseCases extends UseCase{

  DioServer? _dioServer;
  DataUseCases(this._dioServer);

  @override
  Future <Response>call(
      {required String path, Map<String, dynamic>? query})async {
    return await _dioServer!.dio.get(path,queryParameters: query,);
  }

  @override
  Future<Response> callPost({required String path, Map<String, dynamic>? data}) async{
    return await _dioServer!.dio.post(path,data: data);
  }



  // @override
  // Future<DioState<dynamic>> callable(data)async {
  //   return await data;
  // }

}