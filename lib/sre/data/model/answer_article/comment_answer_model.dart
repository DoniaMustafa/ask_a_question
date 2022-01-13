import 'package:discy_application/sre/data/model/answer_article/author_answer_model.dart';
import 'package:discy_application/sre/data/model/answer_article/author_badge__answer_model.dart';
import 'package:discy_application/sre/domain/entities/answer_article/author_ans.dart';
import 'package:discy_application/sre/domain/entities/answer_article/badge_answer.dart';
import 'package:discy_application/sre/domain/entities/answer_article/comment_answer.dart';

class CommentAnswerModel extends CommentAnswer {
  CommentAnswerModel(
      {required int? id,
        required String? name,
        required String? date,
        required String? content,
        required AuthorAnswerModel? author,
        required String? postTitle,
        required int? commentVote})
      : super(id, name, date, content, author, postTitle,
            commentVote);

  factory CommentAnswerModel.fromJson(Map<String, dynamic> json) => CommentAnswerModel(
    id: json["id"],
    name: json["name"],
    date: json["date"],
    content: json["content"],
    author: AuthorAnswerModel.fromJson(json["author"]),
    postTitle: json["post_title"],
    commentVote: json["comment_vote"],
  );


}
