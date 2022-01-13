
import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:discy_application/sre/domain/entities/answer_article/comment_answer.dart';
import 'package:discy_application/sre/presentation/widgets/listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';

import 'default_circle_widget.dart';

titleAnswer({required CommentAnswer comment}) => RichText(
  text: TextSpan(
    style: textTheme.headline6,
    text: comment.postTitle.toString(),
  ),
);

buildAnswerUserInfo(CommentAnswer author) => Row(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      userPhoto(author:author.author!.avatar.toString()),
      SizedBox(
        width: 15,
      ),
      userInfoAnswer(authorInfo: author),
    ]);
userInfoAnswer({required CommentAnswer authorInfo}) => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(
      children: [
        RichText(
          text: TextSpan(
              text: authorInfo.name,
              style: textTheme.subtitle1!
                  .copyWith(color: Colors.indigoAccent)),
        ),
        if (authorInfo.author!.verified = true)
          SizedBox(
            width: 5,
          ),
        if (authorInfo.author!.verified = true)
          DefaultCircleWidget(
            icon: Icons.done,
            isIcon: true,
            r: 8,
            wd: 50,
            ht: 20,
            iconSize: 12,
            iconColor: Colors.white,
          ),
      ],
    ),
    SizedBox(
      height: 8,
    ),
    Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
      alignment: Alignment.centerLeft,
      color: HexColor(authorInfo.author!.badge!.color),
      child: RichText(
        text: TextSpan(
            text: authorInfo.author!.badge!.name,
            style: textTheme.bodyText2!.copyWith(color: Colors.white)),
      ),
    ),
    Container(
      child: Divider(
        thickness: 2,
      ),
    ),
    dateTimeAnswer(dateTime: authorInfo.date.toString()),
  ],
);

dateTimeAnswer({required String dateTime}) => RichText(
  text:
  TextSpan(text: ' Answer On  ${dateTime}', style: textTheme.caption),
);
contentAnswer({required CommentAnswer comment}) => Container(
  child: Html(data: comment.content),
);

// circleButtonAnswer({required CommentAnswer comment}) => Row(
//   children: [
//     buttonAction(),
//     Padding(
//       padding: EdgeInsets.only(left: 10, right: 10),
//       child: RichText(
//         text: TextSpan(
//             text: comment.commentVote.toString(),
//             style: textTheme.caption),
//       ),
//     ),
//     buttonAction(),
//   ],
// );