import 'package:dio/src/response.dart';
import 'package:discy_application/sre/core/utils/end_point.dart';
import 'package:discy_application/sre/domain/repositories/dio_server_repo.dart';
import 'package:discy_application/sre/domain/repositories/settings_repo.dart';

class SettingImplementation implements SettingRepository{
  DioServerRepos? _dioServerRepos;
  SettingImplementation(this._dioServerRepos);

  @override
  Future<Response> getFAQ() async{
    return await _dioServerRepos!.call(path: kFAQ,query: {
      "id":34
    });
  }

  @override
  Future<Response> getNotify() async{
    return await _dioServerRepos!.call(path: kNotify,query: {
      "page":1
    });

  }

}