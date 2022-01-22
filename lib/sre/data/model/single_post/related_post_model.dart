import 'package:discy_application/sre/data/model/single_post/post_element_model.dart';
import 'package:discy_application/sre/domain/entities/single_post/post_element.dart';
import 'package:discy_application/sre/domain/entities/single_post/related_posts.dart';

class RelatedPostsModel extends RelatedPosts {
  RelatedPostsModel(
      {String? style, int? count, int? countTotal, List<PostElement>? posts})
      : super(style, count, countTotal, posts);

  factory RelatedPostsModel.fromJson(Map<String, dynamic> json) =>
      RelatedPostsModel(
        style: json["style"],
        count: json["count"],
        countTotal: json["count_total"],
        posts: List<PostElementModel>.from(
            json["posts"].map((x) => PostElementModel.fromJson(x))),
      );
}
