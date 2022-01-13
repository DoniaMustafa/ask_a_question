import 'package:equatable/equatable.dart';

class FAQ extends Equatable{
  FAQ(this.question, this.answer);

  final String question;
  final String answer;


  @override
  // TODO: implement props
  List<Object?> get props =>[question,answer];
  @override
  bool? get stringify => true;

}