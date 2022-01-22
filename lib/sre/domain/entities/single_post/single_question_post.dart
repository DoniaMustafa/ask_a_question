import 'package:discy_application/sre/domain/entities/article/author.dart';
import 'package:discy_application/sre/domain/entities/article/category.dart';
import 'package:discy_application/sre/domain/entities/article/custom_fields.dart';
import 'package:discy_application/sre/domain/entities/article/tags.dart';
import 'package:discy_application/sre/domain/entities/single_post/related_posts.dart';
import 'package:equatable/equatable.dart';

class SingleQuestionPost extends Equatable{

  SingleQuestionPost(
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
  );

  final int? id;
  final String? type;
  final String? status;
  final String? title;
  final String? content;
  final String? date;
  final String? modified;
  final List<Category>? categories;
  final List<Tags>? tags;
  final Author? author;
  final CustomFields? customFields;
  final RelatedPosts? relatedPosts;




  @override
  // TODO: implement props
  List<Object?> get props =>[this.id,
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
    this.relatedPosts,];
}