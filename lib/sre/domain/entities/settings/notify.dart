import 'package:equatable/equatable.dart';

class Notify extends Equatable {
  final int id;
  final String title;
  final String icon;
  final String color;
  final String type;
  final String text;
  final String date;
  final bool json;
  Notify(this.id, this.title, this.icon, this.color, this.type, this.text,
      this.date, this.json);

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        icon,
        color,
        type,
        text,
        date,
        json,
      ];

  @override
  bool? get stringify => true;
}
