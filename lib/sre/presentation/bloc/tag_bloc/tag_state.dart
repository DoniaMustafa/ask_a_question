part of 'tag_cubit.dart';

@immutable
abstract class TagState {}

class TagInitial extends TagState {}
class TagLoadingState extends TagState {}
class TagSuccessState extends TagState {
final  ResponseTagModel? tagModel;

TagSuccessState(this.tagModel);
}
class TagErrorState extends TagState {}
