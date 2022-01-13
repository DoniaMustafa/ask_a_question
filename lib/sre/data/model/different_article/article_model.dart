import 'package:discy_application/sre/data/model/article/tags_model.dart';
import 'package:discy_application/sre/data/model/different_article/image_model.dart';
import 'package:discy_application/sre/data/model/different_article/tags_model.dart';
import 'package:discy_application/sre/domain/entities/article/article.dart';
import 'package:discy_application/sre/domain/entities/article/category.dart';
import 'package:discy_application/sre/domain/entities/article/tags.dart';
import 'package:discy_application/sre/domain/entities/different_article/defferent_articl.dart';
import 'package:discy_application/sre/domain/entities/different_article/different_author.dart';
import 'package:discy_application/sre/domain/entities/different_article/different_custom_fields.dart';
import 'package:discy_application/sre/domain/entities/different_article/different_image.dart';

import 'author_model.dart';
import 'caregory_model.dart';
import 'custom_fields_model.dart';

class DifferentArticleModel extends DifferentArticle {
  DifferentArticleModel({
     String? thumbnail,
    String? type,
    int? id,
    String? status,
    String? title,
    String? content,
    String? date,
    List<DifferentCategoryModel>? categories,
    List<DifferentTagsModel>? tags,
    DifferentAuthorModel? author,
    List? attachments,
    String? commentStatus,
    DifferentCustomFieldsModel? customFields,
    bool? favorite,
    bool? polled})
      : super(
            thumbnail,
      type,
            id,
            status,
            title,
            content,
            date,
            categories,
            tags,
            author,
            attachments,
            commentStatus,
            customFields,
            favorite,
            polled);

  factory DifferentArticleModel.fromJson(Map<String, dynamic> json) => DifferentArticleModel(
        id: json["id"],
        status: json["status"],
        type: json["type"],
        title: json["title"],
        content: json["content"],
        date: json["date"],
        categories: List<DifferentCategoryModel>.from(
            json["categories"].map((x) => DifferentCategoryModel.fromJson(x))),
        tags: List<DifferentTagsModel>.from(
            json["tags"].map((x) => DifferentTagsModel.fromJson(x))),
        author: DifferentAuthorModel.fromJson(json["author"]),
      thumbnail:json["thumbnail"],
      attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        commentStatus: json["comment_status"],
        customFields: DifferentCustomFieldsModel.fromJson(json["custom_fields"]),
        favorite: json["favorite"],
        polled: json["polled"],
      );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "url": url,
  //       "status": status,
  //       "title": title,
  //       "content": content,
  //       "date": date,
  //       "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  //       "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
  //       "author": author.toJson(),
  //       "attachments": List<dynamic>.from(attachments.map((x) => x)),
  //       "comment_status": commentStatus,
  //       "custom_fields": customFields.toJson(),
  //       "favorite": favorite,
  //       "polled": polled,
  //       "thumbnail_images":thumbnailImage
  //     };
}
