import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:discy_application/sre/domain/entities/answer_article/author_ans.dart';
import 'package:discy_application/sre/domain/entities/answer_article/comment_answer.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/answer_bloc/answer_ques_cubit.dart';
import 'package:discy_application/sre/presentation/widgets/default_circle_widget.dart';
import 'package:discy_application/sre/presentation/widgets/listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../di.dart';

class AnswersScreen extends StatelessWidget {
  const AnswersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnswerQuesCubit, AnswerQuesState>(
        builder: (context, state) {
      if (state is AnswerQuesSuccessStates && state.answerModel != null) {
        print(state.commentModel.length);
        return Container(
          child: SingleChildScrollView(

            child: Column(
              children: [
                ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      print(state.answerModel);
                      return _listAnswer(state.commentModel[i]);
                    },
                    separatorBuilder: (context, i) => Divider(),
                    itemCount: state.commentModel.length),
                if (di<AnswerQuesCubit>().c  <=state.answerModel.pages!)
                  TextButton(
                    onPressed: () {
                      print(di<AnswerQuesCubit>().c);

                      if (di<AnswerQuesCubit>().c <=
                          state.answerModel.pages!) {
                        print(' ds : ${ state.answerModel.pages!}');
                        di<AnswerQuesCubit>().getAnswerQuesArticle();
                      } else {
                        Fluttertoast.showToast(msg: 'no data');
                      }
                    },
                    child: Text('More...'),
                  )
              ],
            ),
          ),
        );
      } else {
        return Center(child: CircularProgressIndicator());
      }
    });
  }

  _listAnswer(CommentAnswer commentModel) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleAnswer(comment: commentModel),
            SizedBox(
              height: 15,
            ),
            buildAnswerUserInfo(commentModel),
            SizedBox(
              height: 15,
            ),
            contentAnswer(comment: commentModel),
            SizedBox(
              height: 15,
            ),
            circleButtonAnswer(comment: commentModel)
          ],
        ),
      );

  titleAnswer({required CommentAnswer comment}) => RichText(
        text: TextSpan(
          style: textTheme.headline6,
          text: comment.postTitle.toString(),
        ),
      );

  buildAnswerUserInfo(CommentAnswer author) => Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            userPhoto(author: author.author!.avatar.toString()),
            SizedBox(
              width: 15,
            ),
            userInfoAnswer(authorInfo: author),
          ]);
  userPhotoAnswer({required AuthorAnswer author}) => DefaultCircleWidget(
        isIcon: false,
        r: 30,
        image: author.avatar.toString(),
        onPress: () {},
      );
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
          Divider(),
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

  circleButtonAnswer({required CommentAnswer comment}) => Row(
        children: [
          DefaultCircleWidget(
            icon: Icons.arrow_drop_up,
            r: 17,
            iconSize: 20,
            isIcon: true,
            onPress: () {},
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: RichText(
              text: TextSpan(
                  text: comment.commentVote.toString(),
                  style: textTheme.caption),
            ),
          ),
          DefaultCircleWidget(
            isIcon: true,
            icon: Icons.arrow_drop_down,
            r: 17,
            iconSize: 20,
            onPress: () {},
          ),
        ],
      );
}
