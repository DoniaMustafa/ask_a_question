import 'package:equatable/equatable.dart';

class ChangeFavorite extends Equatable{

  final bool status;
  final bool  favorite;

  ChangeFavorite({required this.status,required  this.favorite});

  @override
  // TODO: implement props
  List<Object?> get props => [this.status, this.favorite];
}