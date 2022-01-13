import 'package:discy_application/sre/config/color/def_color.dart';
import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:discy_application/sre/data/model/article/article_model.dart';
import 'package:discy_application/sre/di.dart';
import 'package:discy_application/sre/domain/entities/article/article.dart';
import 'package:discy_application/sre/presentation/bloc/fav_bloc/fav_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/home_bloc/home_cubit.dart';
import 'package:discy_application/sre/presentation/widgets/listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

buildCategAndDate({required Article article, required context}) =>
    Row(children: [
      category(
          categories: article.categories!, onPress: () {}, context: context),
      dateTime(dateTime: article),
      Spacer(
        flex: 1,
      ),
      flagCircle(onPress: () {}),
    ]);
buildUserInfo(Article article) => Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          userPhoto(author: article.author!.avatar.toString()),
          SizedBox(
            width: 15,
          ),
          userInfo(userInfo: article),
          Spacer(
            flex: 1,
          ),
          topActionButt(
            customFields: article,
          )
        ]);

buildButtonsAction(Article articleModel, context) => Row(children: [
      answerBut(onPress: () {}),
      Spacer(
        flex: 1,
      ),
      Container(
        child: Row(
          children: [
            viewsIcon(onPress: () {}),
            viewsPeople(customFieldsModel: articleModel.customFields!),
          ],
        ),
      ),
      SizedBox(
        width: 10,
      ),
      Container(
        child: Row(
          children: [
            commentIcon(
                onPress: () {},
                context: context,
                id: articleModel.id!,
                type: articleModel.type!),
            commentNumb(customFieldsModel: articleModel.customFields!),
          ],
        ),
      ),
      SizedBox(
        width: 10,
      ),
      faveIcon(article: articleModel),
    ]);
