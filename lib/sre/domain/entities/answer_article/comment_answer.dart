import 'package:discy_application/sre/domain/entities/answer_article/author_ans.dart';
import 'package:discy_application/sre/domain/entities/answer_article/badge_answer.dart';
import 'package:equatable/equatable.dart';

class CommentAnswer extends Equatable{
  final int? id;
  final String? name;
  final String? date;
  final String? content;
  final AuthorAnswer? author;
  final String? postTitle;
  final int? commentVote;
  CommentAnswer(this.id, this.name, this.date, this.content, this.author,
      this.postTitle, this.commentVote);



  @override
  // TODO: implement props
  List<Object?> get props => [id,name,date,content,author,postTitle ,commentVote];

  @override
  bool? get stringify => true;




  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "date": date,
    "content": content,
    "author": author!.toJson(),
    "post_title": postTitle,
    "comment_vote": commentVote,
  };
}