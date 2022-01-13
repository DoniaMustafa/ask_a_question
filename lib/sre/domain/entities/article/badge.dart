import 'package:equatable/equatable.dart';

class Badge extends Equatable {
  final String name;
  final String color;
  Badge( this.name,  this.color);

  @override
  List<Object?> get props => [name, color];
  @override
  bool? get stringify => true;

}
