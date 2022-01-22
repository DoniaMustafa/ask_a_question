import 'package:discy_application/sre/data/model/article/author_model.dart';
import 'package:discy_application/sre/data/model/article/caregory_model.dart';
import 'package:discy_application/sre/data/model/article/custom_fields_model.dart';
import 'package:discy_application/sre/data/model/article/tags_model.dart';
import 'package:discy_application/sre/data/model/single_post/related_post_model.dart';
import 'package:discy_application/sre/domain/entities/single_post/single_question_post.dart';

class SingleQuestionPostModel extends SingleQuestionPost {
  SingleQuestionPostModel(
      {int? id,
        String? type,
        String? status,
        String? title,
        String? content,
        String? date,
        String? modified,
        List<CategoryModel>? categories,
        List<TagsModel>? tags,
        AuthorModel? author,
        CustomFieldsModel? customFields,
        RelatedPostsModel? relatedPosts})
      : super(id, type, status, title, content, date, modified, categories,
      tags, author, customFields, relatedPosts);

  factory SingleQuestionPostModel.fromJson(Map<String, dynamic> json) =>
      SingleQuestionPostModel(
        id: json["id"],
        type: json["type"],
        status: json["status"],
        title: json["title"],
        content: json["content"],
        date: json["date"],
        modified: json["modified"],
        categories: List<CategoryModel>.from(
            json["categories"].map((x) => CategoryModel.fromJson(x))),
        tags: List<TagsModel>.from(
            json["tags"].map((x) => TagsModel.fromJson(x))),
        author: AuthorModel.fromJson(json["author"]),
        customFields: CustomFieldsModel.fromJson(json["custom_fields"]),
        relatedPosts: RelatedPostsModel.fromJson(json["related_posts"]),
      );
}
