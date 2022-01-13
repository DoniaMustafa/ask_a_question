import 'package:equatable/equatable.dart';

class SingleCategory extends Equatable{
  SingleCategory(
  this.id,
  this.name,
 );

  final int id;
  final String name;


  @override
  // TODO: implement props
  List<Object?> get props =>[id,name];
  @override
  bool? get stringify => true;

}