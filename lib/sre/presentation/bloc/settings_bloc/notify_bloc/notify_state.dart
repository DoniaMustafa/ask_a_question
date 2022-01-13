part of 'notify_cubit.dart';

@immutable
abstract class NotifyState {}

class NotifyInitial extends NotifyState {}
class NotifyLoadingState extends NotifyState {}
class NotifySuccessState extends NotifyState {
        final NotificationModel notify;

        NotifySuccessState({required this.notify});
}
class NotifyErrorState extends NotifyState {
  final String error;

  NotifyErrorState({required this.error});
}
