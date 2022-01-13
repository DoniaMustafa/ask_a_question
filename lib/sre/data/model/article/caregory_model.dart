import 'package:discy_application/sre/domain/entities/article/category.dart';

class CategoryModel extends Category {
  CategoryModel({
     int? id,
     String? name,
     String? description,
     int? categoryFollowers,
     List<String>? followers,
    String? taxonomy,
  }) : super(
          id,
          name,
          description,
    categoryFollowers,
    followers,
    taxonomy,

  );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
    taxonomy:json["taxonomy"],
    name: json["name"],
        description: json["description"],
        categoryFollowers: json["category_followers"],
        followers: List<String>.from(json["followers"].map((x) => x)),
      );
}
