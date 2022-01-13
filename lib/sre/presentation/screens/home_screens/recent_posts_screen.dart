import 'package:discy_application/sre/config/color/def_color.dart';
import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:discy_application/sre/config/routes/route.dart';
import 'package:discy_application/sre/domain/entities/different_article/defferent_articl.dart';
import 'package:discy_application/sre/domain/entities/different_article/different_author.dart';
import 'package:discy_application/sre/domain/entities/different_article/different_custom_fields.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/recent_post_cubit/recent_post_ques_cubit.dart';
import 'package:discy_application/sre/presentation/screens/single_category_screen.dart';
import 'package:discy_application/sre/presentation/widgets/default_circle_widget.dart';
import 'package:discy_application/sre/presentation/widgets/listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';

class RecentPostsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentPostQuesCubit, RecentPostQuesState>(
        builder: (context, state) {
      if (state is RecentPostSuccessState && state.articleModel != null) {
        print(state.articleModel!.articleModel!.length);
        return Container(
          child: ListView.separated(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, i) {
                print(state.articleModel!.articleModel![i].categories);
                return _buildListOfArticle(
                  context: context,
                    article: state.articleModel!.articleModel![i]);
              },
              separatorBuilder: (context, i) => Divider(),
              itemCount: state.articleModel!.articleModel!.length),
        );
      } else {
        return Center(child: CircularProgressIndicator());
      }
    });
  }

  _buildListOfArticle({
    required DifferentArticle article,
    required context  }) =>
      Container(
        padding: EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _buildCategoryAndDate(
            context:context ,
            article: article,
          ),
          SizedBox(
            height: 15,
          ),

          _userInfo(userInfo: article.author!),
          SizedBox(height: 20),
          _title(article: article),
          SizedBox(height: 20),
          _content(articleModel: article),
          SizedBox(height: 20),

          _buildTags(article: article),
          Divider(),
          _buildButtonsAction(articleModel: article,context: context),
        ]),
      );

  _buildCategoryAndDate({required DifferentArticle article,required context}) => Row(
        children: [
      GestureDetector(
      onTap: () {
  // print(categoryModel.id);
  // print(article.type);

  navigatorTo(
  context: context,
  widget: SingleCategoryScreen(
  id: article.categories![0].id!.toInt(),
  name:article.categories![0].name!.toString()));
},

            child: RichText(
              text: TextSpan(
                text: '${article.categories![0].name} -',
                style: textTheme.caption!.copyWith(color: Colors.black),
              ),
            ),
          ),
          RichText(
            text: TextSpan(
                text: ' Asked at ${article.date}', style: textTheme.caption),
          )
        ],
      );

  _userInfo({required DifferentAuthor userInfo}) => Row(
        children: [
          DefaultCircleWidget(
            isIcon: false,
            r: 30,
            image: userInfo.avatar.toString(),
            onPress: () {},
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                        text: userInfo.name,
                        style: textTheme.subtitle1!
                            .copyWith(color: Colors.indigoAccent)),
                  ),
                  if (userInfo.verified = true)
                    SizedBox(
                      width: 5,
                    ),
                  if (userInfo.verified = true)
                    DefaultCircleWidget(
                      icon: Icons.done,
                      isIcon: true,
                      r: 8,
                      wd: 50,
                      ht: 20,                      iconSize: 12,
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
                color: HexColor(userInfo.badge.color),
                child: RichText(
                  text: TextSpan(
                      text: userInfo.badge.name,
                      style:
                          textTheme.bodyText2!.copyWith(color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      );
  _title({required DifferentArticle article}) => RichText(
    text: TextSpan(
      style: textTheme.headline6,
      text: article.title.toString(),
    ),
  );
  _content({required DifferentArticle articleModel}) => Container(
    child: Html(data: articleModel.content),
  );

  _buildTags({required DifferentArticle article}) => Container(
        child: Row(
          children: List.generate(
            article.tags!.length,
            (index) => Container(
              color: lightGrey(),
              margin: EdgeInsets.only(left: 10),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: RichText(
                text: TextSpan(
                    text: '#${article.tags![index].name}',
                    style: textTheme.subtitle2),
              ),
            ),
          ),
        ),
      );
  _buildButtonsAction({required DifferentArticle articleModel,required context}) => Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            answerBut(onPress: () {}),
            Spacer(
              flex: 1,
            ),
            Container(
              child: Row(
                children: [
                  viewsIcon(onPress: () {}),
                  _viewsPeople(customFieldsModel: articleModel.customFields!),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              child: Row(
                children: [
                  commentIcon(onPress: () {},context:context ,id:articleModel.id! ,type: articleModel.type! ),
                  _commentNumb(customFieldsModel: articleModel.customFields!),
                ],
              ),
            ),
          ]);
  _commentNumb({required DifferentCustomFields customFieldsModel}) => RichText(
    text: TextSpan(
      style:textTheme.button!.copyWith(color: Colors.black),

      text: customFieldsModel.commentCount![0].toString(),
    ),
  );


  _viewsPeople({required DifferentCustomFields customFieldsModel}) => RichText(
    text: TextSpan(
      style: textTheme.button!.copyWith(color: Colors.black),
      text: customFieldsModel.postStats![0].toString(),
    ),
  );
}
