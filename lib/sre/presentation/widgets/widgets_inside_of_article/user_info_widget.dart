import 'package:discy_application/sre/config/color/def_color.dart';
import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:discy_application/sre/domain/entities/answer_article/comment_answer.dart';
import 'package:discy_application/sre/domain/entities/article/article.dart';
import 'package:discy_application/sre/presentation/widgets/default_circle_widget.dart';
import 'package:discy_application/sre/presentation/widgets/list_answer_widget.dart';
import 'package:discy_application/sre/presentation/widgets/listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class UserInfoWidget extends StatelessWidget {
   UserInfoWidget({Key? key,required this.author}) : super(key: key);
  final Article author;
  @override
  Widget build(BuildContext context) {
    return  Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          userPhoto(author:author.author!.avatar.toString()),
          SizedBox(
            width: 15,
          ),
          userInfoAnswer(),
        ]);
  }

  userInfoAnswer() => Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              RichText(
                text: TextSpan(
                    text: author.author!.name.toString(),
                    style: textTheme.subtitle1!
                        .copyWith(color: Colors.indigoAccent)),
              ),
              if ( author.author!.verified = true)
                SizedBox(
                  width: 5,
                ),
              if (author.author!.verified = true)
                DefaultCircleWidget(
                  icon: Icons.done,
                  isIcon: true,
                  r: 17,
                  iconSize: 15,
                  circleColor: blue(),
                  wd: 50,
                  ht: 20,
                  iconColor: Colors.white,
                ),
            ],
          ),
          if (author.categories != null)
            SizedBox(
              height: 8,
            ),
          if (author.author!.badge!.color != "" ||
              author.author!.badge!.name != "")
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
              alignment: Alignment.centerLeft,
              color: HexColor(
                  '${author.author!.badge!.color != "" ? author.author!.badge!.color : '#00000000'}'),
              child: author.author!.badge!.name == null
                  ? Container()
                  : RichText(
                text: TextSpan(
                    text: author.author!.badge!.name,
                    style: textTheme.bodyText2!
                        .copyWith(color: Colors.white)),
              ),
            ),
        ],
      ));

}
