import 'package:bloc/bloc.dart';
import 'package:discy_application/sre/data/model/login/login_model.dart';
import 'package:discy_application/sre/domain/repositories/login_repo.dart';
import 'package:flutter/cupertino.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(LoginInitial());
  final LoginRepository _loginRepo;
  LoginModel? _loginModel;
  TextEditingController? controller = TextEditingController();

  TextEditingController? passController = TextEditingController();
  final key = GlobalKey<FormState>();

  bool isShow = false;

  changeSuffix() {
    isShow = !isShow;
    emit(ChangeSuffixState());
  }

  login({required String userName, required String pass})async {
    print(state);
    emit(LoginLoadingState());
    return await _loginRepo.login(userName: userName, pass: pass).then((value) {
      _loginModel = loginModelFromJson(value.toString());
      print('loginModel : $_loginModel');
      emit(LoginSuccessState(_loginModel!));
    }).catchError((error) {
      print('error : ${error.toString()}');
      emit(LoginErrorState(error.toString()));
    });
  }

  forgotPass(String email)async{
    emit(LoginForgotPassLoadingState());
    return await _loginRepo.forgotPass(email: email).then((value) {
      print('value : ${value.data}');
      print('value : ${value.data["status"]}');

      emit(LoginForgotPassSuccessState(value.data["status"]));
    }).catchError((error) {
      print('error : ${error.toString()}');

      emit(LoginForgotPassErrorState());
    });
  }
}
