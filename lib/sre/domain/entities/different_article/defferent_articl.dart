import 'package:discy_application/sre/domain/entities/article/author.dart';
import 'package:discy_application/sre/domain/entities/article/category.dart';
import 'package:discy_application/sre/domain/entities/article/custom_fields.dart';
import 'package:discy_application/sre/domain/entities/article/tags.dart';
import 'package:discy_application/sre/domain/entities/different_article/different_author.dart';
import 'package:discy_application/sre/domain/entities/different_article/different_custom_fields.dart';
import 'package:discy_application/sre/domain/entities/different_article/different_image.dart';
import 'package:equatable/equatable.dart';

class DifferentArticle extends Equatable {
  final int? id;
  final String? status;
  final String? title;
  final String? type;

  final String? content;
  final String? date;
  final List<Category>? categories;
  final List<Tags>? tags;
  final DifferentAuthor? author;
  final String? thumbnail;
  final List<dynamic>? attachments;
  final String? commentStatus;
  final DifferentCustomFields? customFields;
  final bool? favorite;
  final bool? polled;
  // final ThumbnailImage thumbnailImage;


  DifferentArticle(
      this.thumbnail,
      this.type,
      this.id,
      this.status,
      this.title,
      this.content,
      this.date,
      this.categories,
      this.tags,
      this.author,
      this.attachments,
      this.commentStatus,
      this.customFields,
      this.favorite,
      this.polled);

  @override
  List<Object?> get props => [
    id,
    type,
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
    polled
  ];
  bool? get stringify => true;
}
