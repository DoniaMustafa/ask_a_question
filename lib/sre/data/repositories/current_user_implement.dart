import 'package:dio/src/response.dart';
import 'package:discy_application/sre/core/utils/end_point.dart';
import 'package:discy_application/sre/domain/repositories/current_user_repo.dart';
import 'package:discy_application/sre/domain/repositories/dio_server_repo.dart';

class CurrentUserImplement implements CurrentUserRepository{
  CurrentUserImplement(this._dioServerRepos);

  DioServerRepos _dioServerRepos;
  @override
  Future<Response> getCurrentUser() async{
    return await _dioServerRepos.call(path: kCurrentUser);
  }

}