import 'package:discy_application/sre/data/model/article/tags_model.dart';
import 'package:discy_application/sre/domain/entities/article/article.dart';
import 'author_model.dart';
import 'caregory_model.dart';
import 'custom_fields_model.dart';

class ArticleModel extends Article {
  ArticleModel(
      {int? id,
      String? status,
      String? title,
      String? content,
      String? date,
      List<CategoryModel>? categories,
      List<TagsModel>? tags,
      AuthorModel? author,
      String? type,
      List? attachments,
      String? commentStatus,
      CustomFieldsModel? customFields,
      bool? favorite,
      bool? polled})
      : super(
            id,
            status,
            title,
            content,
            date,
            categories,
            tags,
            author,
            type,
            attachments,
            commentStatus,
            customFields,
            favorite,
            polled);
  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
    id: json["id"],
    type: json["type"],
    status: json["status"],
    title: json["title"],
    content: json["content"],
    date: json["date"],
    categories:List<CategoryModel>.from(
        json["categories"].map((x) => CategoryModel.fromJson(x))),
    tags: List<TagsModel>.from(
        json["tags"].map((x) => TagsModel.fromJson(x))),
    author: AuthorModel.fromJson(json["author"]),
    attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
    commentStatus: json["comment_status"],
    customFields: CustomFieldsModel.fromJson(json["custom_fields"]),
    favorite: json["favorite"] ,
    polled: json["polled"]
  );

}
