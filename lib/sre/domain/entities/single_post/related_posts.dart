import 'package:discy_application/sre/domain/entities/single_post/post_element.dart';
import 'package:equatable/equatable.dart';

class RelatedPosts extends Equatable{

  RelatedPosts(
    this.style,
    this.count,
    this.countTotal,
    this.posts,
  );

  final String? style;
  final int? count;
  final int? countTotal;
  final List<PostElement>? posts;
  @override
  // TODO: implement props
  List<Object?> get props =>[
   style,
   count,
   countTotal,
   posts,];
}