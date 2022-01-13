part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeLoaded extends HomeState {
final VoteModel vote;

HomeLoaded(this.vote);
}
class HomeError extends HomeState {}
