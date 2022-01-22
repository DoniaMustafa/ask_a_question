import 'package:discy_application/sre/domain/entities/article/article.dart';
import 'package:discy_application/sre/presentation/widgets/listview_widget.dart';
import 'package:discy_application/sre/presentation/widgets/widgets_inside_of_article/circle_action_button_widget.dart';
import 'package:discy_application/sre/presentation/widgets/widgets_inside_of_article/user_info_widget.dart';
import 'package:flutter/material.dart';

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
          UserInfoWidget(author: article,),
          Spacer(
            flex: 1,
          ),
          CircleActionButtonWidget(
            customFields: article,
          )
        ]);

// buildButtonsAction(Article articleModel, context) => Row(children: [
//       answerBut(onPress: () {}),
//       Spacer(
//         flex: 1,
//       ),
//       Container(
//         child: Row(
//           children: [
//             viewsIcon(onPress: () {}),
//             viewsPeople(customFieldsModel: articleModel.customFields!),
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
//                 id: articleModel.id!,
//                 type: articleModel.type!),
//             commentNumb(customFieldsModel: articleModel.customFields!),
//           ],
//         ),
//       ),
//       SizedBox(
//         width: 10,
//       ),
//       faveIcon(article: articleModel),
//     ]);
