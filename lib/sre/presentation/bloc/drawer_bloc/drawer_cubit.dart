import 'package:bloc/bloc.dart';
import 'package:discy_application/sre/data/model/response_current_user/current_user_response_model.dart';
import 'package:discy_application/sre/domain/repositories/current_user_repo.dart';
import 'package:meta/meta.dart';
part 'drawer_state.dart';


class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit(this._currentUserRepository) : super(UserInfoInitial());
  CurrentUserRepository  _currentUserRepository;
// kCurrentUser
  ResponseCurrentUserModel? responseCurrentUserModel;
  getCurrentUser(){
    emit(UserInfoLoading());
    _currentUserRepository.getCurrentUser().then((value) {
      responseCurrentUserModel=responseCurrentUserModelFromJson(value.toString());
      print(responseCurrentUserModel);
      emit(UserInfoSuccess(responseCurrentUserModel));

    } ).catchError((error){
      emit(UserInfoError());

    });
  }


}
