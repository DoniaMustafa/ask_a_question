import 'package:discy_application/sre/domain/entities/article/author.dart';
import 'package:discy_application/sre/domain/entities/article/category.dart';
import 'package:discy_application/sre/domain/entities/article/custom_fields.dart';
import 'package:discy_application/sre/domain/entities/article/image.dart';
import 'package:discy_application/sre/domain/entities/article/tags.dart';
import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final  int? id;
  final String? type;
  final String? status;
  final String? title;
  final String? content;
  final String? date;
  final List<Category>? categories;
  final List<Tags>? tags;
  final Author? author;
  final String? thumbnail;
  final List<dynamic>? attachments;
  final String? commentStatus;
  final CustomFields? customFields;
  final bool? favorite;
  final bool? polled;
  // final ThumbnailImage thumbnailImage;

  Article(
      this.id,
      this.status,
      this.title,
      this.content,
      this.date,
      this.categories,
      this.tags,
      this.author,
      this.thumbnail,
      this.type,
      this.attachments,
      this.commentStatus,
      this.customFields,
      this.favorite,
      this.polled);

  @override
  List<Object?> get props => [
        id,
        status,
        title,
        content,
        date,
        categories,
        tags,
        author,
    thumbnail,
    type,
        attachments,
        commentStatus,
        customFields,
        favorite,
        polled
      ];
  @override
  bool? get stringify => true;
}
