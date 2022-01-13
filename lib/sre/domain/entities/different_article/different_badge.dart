import 'package:equatable/equatable.dart';

class DifferentBadge extends Equatable {
  final String name;
  final String color;
  DifferentBadge( this.name,  this.color);

  @override
  List<Object?> get props => [name, color];
  bool? get stringify => true;

}
