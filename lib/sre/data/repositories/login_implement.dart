import 'package:dio/src/response.dart';
import 'package:discy_application/sre/core/resources/data_state.dart';
import 'package:discy_application/sre/core/usecases/usecase.dart';
import 'package:discy_application/sre/core/utils/end_point.dart';
import 'package:discy_application/sre/data/model/login/login_model.dart';
import 'package:discy_application/sre/domain/repositories/login_repo.dart';

class LoginImplement implements LoginRepository{
  final UseCase _useCase;

  LoginImplement(this._useCase);

  @override
  Future<Response<dynamic>>login({required String userName, required String pass}) async{
    return await _useCase.call(path: kLogin,query: {
      'insecure':'cool',
      'username':userName,
      'password':pass,
      'device_token':123
    });
  }

  @override
  Future<Response<dynamic>>forgotPass({required String email}) async{
    return await _useCase.call(path: kForgotPass,query: {
      'mobile':1,
      'form_type':'wpqa_forget',
      'user_mail':email,
    });
  }


}