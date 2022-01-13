import 'package:discy_application/sre/domain/entities/article/tags.dart';

class TagsModel extends Tags{
  TagsModel({
required int id,
required String name,
required String description,
required int categoryFollowers,
required List<String> followers,
}) : super(
id,
name,
description,
categoryFollowers,
followers,
);

factory TagsModel.fromJson(Map<String, dynamic> json) => TagsModel(
id: json["id"],
name: json["name"],
description: json["description"],
categoryFollowers: json["category_followers"],
followers: List<String>.from(json["followers"].map((x) => x)),
);}