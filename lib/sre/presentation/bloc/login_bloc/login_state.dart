part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginState {
  final String? error;

  LoginErrorState(this.error);
}

class ChangeSuffixState extends LoginState {}

class LoginForgotPassLoadingState extends LoginState {}

class LoginForgotPassSuccessState extends LoginState {
 final  bool state ;
// final bool error;
 LoginForgotPassSuccessState(this.state,);
}

class LoginForgotPassErrorState extends LoginState {}
