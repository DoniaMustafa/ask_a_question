import 'package:dio/dio.dart';
import 'package:discy_application/sre/core/parameters/api_request..dart';
import 'package:discy_application/sre/data/datasource/remote/dio_server.dart';
import 'package:discy_application/sre/domain/repositories/dio_server_repo.dart';

class DioServerImplementation implements DioServerRepos{
  DioServer? _dioServer;
  DioServerImplementation(this._dioServer);

  @override
  Future <Response>call(
      {required String path, Map<String, dynamic>? query})async {
    return await _dioServer!.dio.get(path,queryParameters: query,);
  }

  @override
  Future<Response> callPost({required String path, Map<String, dynamic>? data}) async{
    return await _dioServer!.dio.post(path,data: data);
  }

}