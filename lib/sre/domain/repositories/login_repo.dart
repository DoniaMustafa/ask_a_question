import 'package:dio/dio.dart';
import 'package:discy_application/sre/core/resources/data_state.dart';
import 'package:discy_application/sre/data/model/login/login_model.dart';

abstract class LoginRepository{
  Future<Response<dynamic>>login({required String userName,required String pass});
  Future<Response<dynamic>>forgotPass({required String email});
}