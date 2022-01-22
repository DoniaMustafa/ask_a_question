import 'package:dio/dio.dart';
import 'package:discy_application/sre/core/usecases/usecase.dart';
import 'package:discy_application/sre/core/utils/end_point.dart';
import 'package:discy_application/sre/domain/repositories/search_repo.dart';

class SearchImplement implements SearchRepository{
 final UseCase _dioServerRepos;
  SearchImplement(this._dioServerRepos);

  @override
  Future<Response> getSearch({required String text}) async {
    return await _dioServerRepos.call(path: kGetSearch,query: {
      'find':text
    });
  }


}