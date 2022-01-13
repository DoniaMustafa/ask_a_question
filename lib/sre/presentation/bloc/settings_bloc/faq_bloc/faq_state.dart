part of 'faq_cubit.dart';

@immutable
abstract class FaqState {}

class FaqInitial extends FaqState {}
class FaqLoadingState extends FaqState {}
class FaqSuccessState extends FaqState {
  final FaqModel faqModel;

  FaqSuccessState({required this.faqModel});
}
class FaqErrorState extends FaqState {
  final String exception;

  FaqErrorState({required this.exception});
}
