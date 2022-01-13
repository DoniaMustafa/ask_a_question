import 'package:equatable/equatable.dart';

class DifferentCategory extends Equatable {
  DifferentCategory(
    this.id,
    this.name,
    this.description,

    this.categoryFollowers,
    this.followers,
  );

  final int id;
  final String name;
  final String description;
  final int categoryFollowers;
  final List<String> followers;

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        description,

        categoryFollowers,
        followers,
      ];

  bool? get stringify => true;
}
