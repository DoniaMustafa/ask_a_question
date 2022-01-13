import 'package:dio/dio.dart';
import 'package:discy_application/sre/core/utils/end_point.dart';
import 'package:discy_application/sre/domain/repositories/category_repo.dart';
import 'package:discy_application/sre/domain/repositories/dio_server_repo.dart';
import 'package:discy_application/sre/domain/repositories/search_repo.dart';

class SearchImplement implements SearchRepository{
 final DioServerRepos _dioServerRepos;
  SearchImplement(this._dioServerRepos);

  @override
  Future<Response> getSearch({required String text}) async {
    return await _dioServerRepos.call(path: kGetSearch,query: {
      'find':text
    });
  }


}