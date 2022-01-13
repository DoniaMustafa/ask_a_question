import 'package:equatable/equatable.dart';

class Category extends Equatable {
  Category(this.id, this.name, this.description, this.categoryFollowers,
      this.followers, this.taxonomy);

  final int? id;
  final String? name;
  final String? taxonomy;
  final String? description;
  final int? categoryFollowers;
  final List<String>? followers;

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
