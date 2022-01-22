import 'package:equatable/equatable.dart';

class Tags extends Equatable{
  Tags(
    this.id,
    this.name,
    this.description,
this.taxonomy,
    this.categoryFollowers,
    this.followers,
  );

  final int id;
  final String name;
  final String description;
  final String taxonomy;

  dynamic categoryFollowers;
  final List<String> followers;

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    name,
    description,
    taxonomy,
    categoryFollowers,
    followers,
  ];

  @override
  bool? get stringify => true;
}