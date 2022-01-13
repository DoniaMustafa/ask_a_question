import 'package:discy_application/sre/domain/entities/single_category.dart';

class DetailsSingleCategoryModel extends SingleCategory{
  DetailsSingleCategoryModel({required int id,required String name}) : super(id, name);


  factory DetailsSingleCategoryModel.fromJson(Map<String, dynamic> json) => DetailsSingleCategoryModel(
  id: json["id"],
  name: json["name"],
  );

  Map<String, dynamic> toJson() => {
  "id": id,
  "name": name,
  };
  }
