import 'package:discy_application/sre/domain/entities/article/category.dart';

class DifferentCategoryModel extends Category {
  DifferentCategoryModel({
    required int id,
    required String name,
    required String description,
    required int categoryFollowers,
    required List<String> followers,
    String? taxonomy,
  }) : super(
          id,
          name,
          description,
          categoryFollowers,
          followers,
          taxonomy,
        );

  factory DifferentCategoryModel.fromJson(Map<String, dynamic> json) =>
      DifferentCategoryModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        categoryFollowers: json["category_followers"],
        followers: List<String>.from(json["followers"].map((x) => x)),
      );
}
