import 'package:equatable/equatable.dart';

class BadgeAnswer extends Equatable {
  final String name;
  final String color;

  BadgeAnswer(this.name, this.color);

  @override
  List<Object?> get props => [name, color];
  @override
  bool? get stringify => true;

  Map<String, dynamic> toJson() => {
    "name": name,
    "color": color,
  };
}

