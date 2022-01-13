import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:discy_application/sre/data/model/notify/notify_model.dart';
import 'package:discy_application/sre/domain/repositories/settings_repo.dart';
import 'package:meta/meta.dart';

part 'notify_state.dart';

class NotifyCubit extends Cubit<NotifyState> {
  NotifyCubit(this._repository) : super(NotifyInitial());
  SettingRepository _repository;
  NotificationModel? notify;
  Future<Response?>getNotify()async{
    emit(NotifyLoadingState());
    return await _repository.getNotify().then((value) {
      notify=notificationModelFromJson( value.toString());
      print(notify);
      emit(NotifySuccessState(notify: notify!));

    }).catchError((error){
      print(error.toString());
      emit(NotifyErrorState(error: error.toString()));


    });
  }
}
