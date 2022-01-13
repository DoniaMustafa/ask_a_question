part of 'drawer_cubit.dart';

@immutable
abstract class UserInfoState {}

class UserInfoInitial extends UserInfoState {}
class UserInfoLoading extends UserInfoState {}
class UserInfoSuccess extends UserInfoState {
 final ResponseCurrentUserModel? responseCurrentUserModel;

 UserInfoSuccess(this.responseCurrentUserModel);
}
class UserInfoError extends UserInfoState {}
