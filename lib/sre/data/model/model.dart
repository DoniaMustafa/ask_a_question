// To parse this JSON data, do
//
//     final singleQuestionmodel = singleQuestionmodelFromJson(jsonString);

import 'dart:convert';

SingleQuestionModel singleQuestionModelFromJson(String str) =>
    SingleQuestionModel.fromJson(json.decode(str));

class SingleQuestionModel {
  SingleQuestionModel({
    this.post,
  });

  final SingleQuestionPostModel? post;

  factory SingleQuestionModel.fromJson(Map<String, dynamic> json) =>
      SingleQuestionModel(
        post: SingleQuestionPostModel.fromJson(json["post"]),
      );
}

class SingleQuestionPostModel {
  SingleQuestionPostModel({
    this.id,
    this.type,
    this.status,
    this.title,
    this.content,
    this.date,
    this.modified,
    this.categories,
    this.tags,
    this.author,
    this.customFields,
    this.relatedPosts,
  });

  final int? id;
  final String? type;
  final String? status;
  final String? title;
  final String? content;
  final String? date;
  final String? modified;
  final List<Category>? categories;
  final List<Tag>? tags;
  final Author? author;
  final CustomFields? customFields;
  final RelatedPosts? relatedPosts;


  factory SingleQuestionPostModel.fromJson(Map<String, dynamic> json) =>
      SingleQuestionPostModel(
        id: json["id"],
        type: json["type"],
        status: json["status"],
        title: json["title"],
        content: json["content"],
        date: json["date"],
        modified: json["modified"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        tags:
            List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        author: Author.fromJson(json["author"]),


        customFields: CustomFields.fromJson(json["custom_fields"]),
        relatedPosts: RelatedPosts.fromJson(json["related_posts"]),
      );
}

class Author {
  Author({
    this.id,
    this.name,
    this.avatar,
    this.verified,
    this.badge,
    this.profileCredential,
  });

  final int? id;
  final String? name;
  final String? avatar;
   bool? verified;
  final Badge? badge;
  final String? profileCredential;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"],
        name: json["name"],
        avatar: json["avatar"],
        verified: json["verified"],
        badge: Badge.fromJson(json["badge"]),
        profileCredential: json["profile_credential"],
      );
}

class Badge {
  Badge({
    this.name,
    this.color,
  });

  final String? name;
  final String? color;

  factory Badge.fromJson(Map<String, dynamic> json) => Badge(
        name: json["name"],
        color: json["color"],
      );
}

class Category {
  Category({
    this.id,
    this.name,
    this.taxonomy,
    this.categoryFollowers,
    this.followers,
  });

  final int? id;
  final String? name;
  final String? taxonomy;
  final int? categoryFollowers;
  final List<String>? followers;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        taxonomy: json["taxonomy"],
        categoryFollowers: json["category_followers"],
        followers: List<String>.from(json["followers"].map((x) => x)),
      );
}

class Tag {
  Tag({
    this.id,
    this.name,
    this.taxonomy,
    this.categoryFollowers,
    this.followers,
  });

  final int? id;
  final String? name;
  final String? taxonomy;
  final int? categoryFollowers;
  final List<String>? followers;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["id"],
        name: json["name"],
        taxonomy: json["taxonomy"],
        categoryFollowers: json["category_followers"],
        followers: List<String>.from(json["followers"].map((x) => x)),
      );
}

class CustomFields {
  CustomFields({
    this.questionVote,
    this.postStats,
    this.commentCount,
    this.postCountAll,
    this.postCountComments,
  });



  final List<String>? questionVote;
  final List<String>? postStats;
  final List<String>? commentCount;
  final List<String>? postCountAll;
  final List<String>? postCountComments;






  factory CustomFields.fromJson(Map<String, dynamic> json) => CustomFields(
        questionVote: List<String>.from(json["question_vote"].map((x) => x)),
        postStats: List<String>.from(json["post_stats"].map((x) => x)),
        commentCount: List<String>.from(json["comment_count"].map((x) => x)),
        postCountAll: List<String>.from(json["post_count_all"].map((x) => x)),
        postCountComments:
            List<String>.from(json["post_count_comments"].map((x) => x)),
      );

}

class RelatedPosts {
  RelatedPosts({
    this.style,
    this.count,
    this.countTotal,
    this.posts,
  });

  final String? style;
  final int? count;
  final int? countTotal;
  final List<PostElement>? posts;

  factory RelatedPosts.fromJson(Map<String, dynamic> json) => RelatedPosts(
        style: json["style"],
        count: json["count"],
        countTotal: json["count_total"],
        posts: List<PostElement>.from(
            json["posts"].map((x) => PostElement.fromJson(x))),
      );


}

class PostElement {
  PostElement({
    this.id,
    this.titlePlain,
    this.content,
    this.date,
    this.categories,
    this.tags,
    this.thumbnail,
    this.commentCount,
  });

  final int? id;
  final String? titlePlain;
  final String? content;
  final String? date;
  final List<Category>? categories;
  final String? thumbnail;
  final List<Tag>? tags;
  final int? commentCount;

  factory PostElement.fromJson(Map<String, dynamic> json) => PostElement(
        id: json["id"],
        titlePlain: json["title_plain"],
        content: json["content"],
        date: json["date"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        tags:
            List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        thumbnail: json["thumbnail"],
        commentCount: json["comment_count"],
      );

}
