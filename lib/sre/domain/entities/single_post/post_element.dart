import 'package:discy_application/sre/domain/entities/article/category.dart';
import 'package:discy_application/sre/domain/entities/article/tags.dart';
import 'package:equatable/equatable.dart';

class PostElement extends Equatable{
  PostElement(
    this.id,
    this.titlePlain,
    this.content,
    this.date,
    this.categories,
    this.tags,
    this.thumbnail,
    this.commentCount,
 );

  final int? id;
  final String? titlePlain;
  final String? content;
  final String? date;
  final List<Category>? categories;
  final String? thumbnail;
  final List<Tags>? tags;
  final int? commentCount;
  @override
  // TODO: implement props
  List<Object?> get props =>[ id,
    titlePlain,
    content, date,
    categories, tags,
    thumbnail, commentCount,];
}