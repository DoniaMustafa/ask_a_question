import 'package:discy_application/sre/data/model/article/caregory_model.dart';
import 'package:discy_application/sre/data/model/article/tags_model.dart';
import 'package:discy_application/sre/domain/entities/article/category.dart';
import 'package:discy_application/sre/domain/entities/article/tags.dart';
import 'package:discy_application/sre/domain/entities/single_post/post_element.dart';

class PostElementModel extends PostElement {
  PostElementModel(
      {int? id,
      String? titlePlain,
      String? content,
      String? date,
      List<Category>? categories,
      List<Tags>? tags,
      String? thumbnail,
      int? commentCount})
      : super(id, titlePlain, content, date, categories, tags, thumbnail,
            commentCount);


  factory PostElementModel.fromJson(Map<String, dynamic> json) => PostElementModel(
    id: json["id"],
    titlePlain: json["title_plain"],
    content: json["content"],
    date: json["date"],
    categories: List<CategoryModel>.from(
        json["categories"].map((x) => CategoryModel.fromJson(x))),
    tags:
    List<TagsModel>.from(json["tags"].map((x) => TagsModel.fromJson(x))),
    thumbnail: json["thumbnail"],
    commentCount: json["comment_count"],
  );

}
