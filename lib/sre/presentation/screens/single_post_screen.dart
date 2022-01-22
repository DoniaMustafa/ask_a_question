import 'package:discy_application/sre/config/color/def_color.dart';
import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:discy_application/sre/data/model/answer_article/answer_question_model.dart';
import 'package:discy_application/sre/data/model/single_post/single_post_model.dart';
import 'package:discy_application/sre/domain/entities/answer_article/comment_answer.dart';
import 'package:discy_application/sre/domain/entities/article/custom_fields.dart';
import 'package:discy_application/sre/domain/entities/single_post/post_element.dart';
import 'package:discy_application/sre/domain/entities/single_post/related_posts.dart';
import 'package:discy_application/sre/presentation/bloc/singel_post_bloc/singel_post_cubit.dart';
import 'package:discy_application/sre/presentation/widgets/default_circle_widget.dart';
import 'package:discy_application/sre/presentation/widgets/list_answer_widget.dart';
import 'package:discy_application/sre/presentation/widgets/listview_widget.dart';
import 'package:discy_application/sre/presentation/widgets/widgets_inside_of_article/reaction_buttons_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../di.dart';

class SingleQuestionScreen extends StatelessWidget {
  const SingleQuestionScreen({Key? key, required this.id, required this.type})
      : super(key: key);
  final int id;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: BlocProvider(
            create: (context) => di<SinglePostCubit>()
              ..getSingleQues(id: id, postType: type)
              ..getAnswerQuestion(id: id, posType: type),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<SinglePostCubit, SinglePostState>(
                  builder: (context, state) {
                    if (di<SinglePostCubit>().answerModel != null &&
                        di<SinglePostCubit>().singleQues != null) {
                      return Column(
                        children: [
                          _buildList(
                              article: di<SinglePostCubit>().singleQues!.post!,
                              postElement: di<SinglePostCubit>()
                                  .singleQues!
                                  .post!
                                  .relatedPosts!
                                  .posts![0],
                              context: context),
                          _buildAnswerList(
                              commentModel: di<SinglePostCubit>().answerModel!)
                        ],
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                // BlocBuilder<SinglePostCubit, SinglePostState>(
                //   builder: (context, state) {
                //     if (state is SinglePostAnswerSuccessState &&
                //         state.answerModel != null) {
                //       print(state.answerModel.comments!.length);
                //       return
                //     } else {  ;
                //       return Center(
                //         child: CircularProgressIndicator(),
                //       );
                //     }
                //   },
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildList(
          {required SingleQuestionPostModel article,
          required PostElement postElement,
          context}) =>
      Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCategAndDate(
                  article: article,
                ),
                SizedBox(
                  height: 15,
                ),
                _buildUserInfo(article),
                SizedBox(height: 20),
                if (postElement.thumbnail != "") _image(img: postElement),
                if (postElement.thumbnail != "") SizedBox(height: 20),
                _title(article: article),
                SizedBox(height: 20),
                _content(articleModel: article),
                _buildTags(article: article),
                Divider(),
                // buildButtonsAction(article, context),
              ],
            ),
          ),
          Divider(
            thickness: 3,
          ),
          _buildRelatedQuestion(postElement: postElement, postModel: article),
          Divider(
            thickness: 3,
          ),
        ],
      );

  _buildCategAndDate({required SingleQuestionPostModel article,context}) =>
      Row(children: [
        category(categories: article.categories!, onPress: () {}, context: context),
        _dateTime(dateTime: article),
        Spacer(
          flex: 1,
        ),
        _flagCircle(onPress: () {}),
      ]);
  _buildUserInfo(SingleQuestionPostModel article) => Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _userPhoto(author: article),
            SizedBox(
              width: 15,
            ),
            _userInfo(userInfo: article),
            Spacer(
              flex: 1,
            ),
            // _topActionButt(
            //     customFields: article, upPress: () {}, downPress: () {})
          ]);

  // buildButtonsAction(CustomFields customFields, context) =>
  //     Row(children: [
  //       answerBut(onPress: () {}),
  //       Spacer(
  //         flex: 1,
  //       ),
  //       Container(
  //         child: Row(
  //           children: [
  //             viewsIcon(onPress: () {}),
  //             viewsPeople(text:customFields.postStats![0].toString()),
  //           ],
  //         ),
  //       ),
  //       SizedBox(
  //         width: 10,
  //       ),
  //       Container(
  //         child: Row(
  //           children: [
  //             commentIcon(
  //                 onPress: () {},
  //                 context: context,
  //                 id:id,
  //                 type: id),
  //             singleQuestionArticle.customFields == null
  //                 ? Container()
  //                 : commentNumb(text: singleQuestionArticle.customFields!.postCountComments![0].toString()),
  //           ],
  //         ),
  //       ),
  //       SizedBox(
  //         width: 10,
  //       ),
  //     ]);



  _dateTime({required SingleQuestionPostModel dateTime}) => RichText(
        text: TextSpan(
            text: ' Asked at ${dateTime.date}', style: textTheme.caption),
      );

  _flagCircle({required Function onPress}) => DefaultCircleWidget(
        icon: Icons.assistant_photo_outlined,
        r: 15,
        isIcon: true,
        iconSize: 15,
        onPress: () => onPress,
      );

  _userInfo({required SingleQuestionPostModel userInfo}) {
    return Container(
        alignment: Alignment.center,
        child: userInfo.author == null || userInfo.categories == null
            ? Container()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                            text: userInfo.author!.name,
                            style: textTheme.subtitle1!
                                .copyWith(color: Colors.indigoAccent)),
                      ),
                      if (userInfo.author!.verified = true)
                        SizedBox(
                          width: 5,
                        ),
                      if (userInfo.author!.verified = true)
                        DefaultCircleWidget(
                          icon: Icons.done,
                          isIcon: true,
                          r: 8,
                          iconSize: 12,
                          wd: 50,
                          ht: 20,
                          iconColor: Colors.white,
                        ),
                    ],
                  ),
                  if (userInfo.categories != null)
                    SizedBox(
                      height: 8,
                    ),
                  if (userInfo.author!.badge!.color != "" ||
                      userInfo.author!.badge!.name != "")
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                      alignment: Alignment.centerLeft,
                      color: HexColor(
                          '${userInfo.author!.badge!.color != "" ? userInfo.author!.badge!.color : '#00000000'}'),
                      child: userInfo.author!.badge!.name == null
                          ? Container()
                          : RichText(
                              text: TextSpan(
                                  text: userInfo.author!.badge!.name,
                                  style: textTheme.bodyText2!
                                      .copyWith(color: Colors.white)),
                            ),
                    ),
                ],
              ));
  }

  _userPhoto({required SingleQuestionPostModel author}) => Container(
        child: author.author == null
            ? Container()
            : DefaultCircleWidget(
                r: 0.0,
                r2: 30,
                isIcon: false,
                // ht: 50,
                height: 50,
                width: 50,
                // wd: 50,
                image: author.author!.avatar.toString(),
                onPress: () {},
              ),
      );
  _image({required PostElement img}) => Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  img.thumbnail.toString(),
                ),
                fit: BoxFit.contain)),
      );
  _title({required SingleQuestionPostModel article}) => RichText(
        text: TextSpan(
          style: textTheme.headline6,
          text: article.title.toString(),
        ),
      );
  _content({required SingleQuestionPostModel articleModel}) => Container(
        child: Html(
          data: articleModel.content,
          style: {
            'body': Style.fromTextStyle(textThemeData.textTheme.bodyText2!)
          },
        ),
      );
  _buildTags({required SingleQuestionPostModel article}) => Container(
        child: article.tags == null
            ? Container()
            : Row(
                children: List.generate(
                  article.tags!.length,
                  (index) => Container(
                    color: lightGrey(),
                    margin: EdgeInsets.only(left: 10),
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: RichText(
                      text: TextSpan(
                          text: '#${article.tags![index].name}',
                          style: textTheme.caption),
                    ),
                  ),
                ),
              ),
      );

  _buildRelatedQuestion(
          {required SingleQuestionPostModel postModel,
          required PostElement postElement}) =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
                    text: 'Related Question',
                    style: textThemeData.textTheme.bodyText1)),
            SizedBox(
              height: 15.0,
            ),
            _relatedQuestion(posts: postModel.relatedPosts!),
          ],
        ),
      );
  _relatedQuestion({
    required RelatedPosts posts,
  }) =>
      ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: posts.posts!.length,
        itemBuilder: (context, index) => Column(
          children: [
            RichText(
              text: TextSpan(
                  text: posts.posts![index].titlePlain,
                  style: textThemeData.textTheme.bodyText2),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.question_answer,
                  color: deepGrey(),
                ),
                SizedBox(
                  width: 5,
                ),
                RichText(
                    text: TextSpan(
                        text: '${posts.posts![index].commentCount} Answer',
                        style: textThemeData.textTheme.bodyText2))
              ],
            )
          ],
        ),
        separatorBuilder: (context, index) => Divider(),
      );

  _buildAnswerList({required AnswerQuestionModel commentModel}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
            child: Text(
              '${commentModel.count.toString()} Answer',
              style: textThemeData.textTheme.bodyText1,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          _usersAnswerList(commentModel),
        ],
      );
  _usersAnswerList(AnswerQuestionModel commentModel) => ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, int index) =>
          _usersAnswer(commentModel.comments![index]),
      separatorBuilder: (context, int index) => Divider(
            thickness: 2,
          ),
      itemCount: commentModel.count!);
  _usersAnswer(CommentAnswer commentModel) => Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildAnswerUserInfo(commentModel),
            SizedBox(
              height: 10,
            ),
            contentAnswer(comment: commentModel),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            // circleButtonAnswer(
            //   comment: commentModel,
            // ),
          ],
        ),
      );

  // userDataAndPublishDate()=>

}
