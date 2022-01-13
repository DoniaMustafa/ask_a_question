import 'package:discy_application/sre/config/color/def_color.dart';
import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:discy_application/sre/data/model/article/article_model.dart';
import 'package:discy_application/sre/domain/entities/article/article.dart';
import 'package:discy_application/sre/domain/entities/article/category.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/most_bloc/most_answer_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/most_bloc/most_answer_state.dart';
import 'package:discy_application/sre/presentation/widgets/build_list_item_widget.dart';
import 'package:discy_application/sre/presentation/widgets/listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MostAnsweredScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MostAnswerCubit, MostAnswerState>(
        builder: (context, state) {
      if (state is MostAnswerSuccessStates &&
          state.articleResponseModel != null) {
        print(state.articleResponseModel.articleModel!.length);
        return Container(
          child: ListView.separated(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, i) {
                // print(state.articleResponseModel.articleModel![i].categories);
                return _buildList(
                    article: state.articleResponseModel.articleModel![i],context: context);
              },
              separatorBuilder: (context, i) => Divider(),
              itemCount: state.articleResponseModel.articleModel!.length),
        );
      } else {
        return Center(child: CircularProgressIndicator());
      }
    });
  }

  _buildList({
    required Article article,required context
  }) =>
      Container(
        padding: EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          buildCategAndDate(
            context:context,
            article: article,
          ),
          SizedBox(
            height: 15,
          ),
          buildUserInfo(article),
          SizedBox(height: 20),
          title(article: article),
          SizedBox(height: 20),
          content(articleModel: article),
          buildTags(article: article,context:context),
          Divider(),
          buildButtonsAction(article,context)
        ]),
      );

  // _buildCategAndDate({required ArticleModel article}) => Row(children: [
  //       category(categories: article.categories!, onPress: () {}),
  //       dateTime(dateTime: article),
  //       Spacer(
  //         flex: 1,
  //       ),
  //       flagCircle(onPress: () {}),
  //     ]);
  // _buildUserInfo(ArticleModel article) => Row(
  //         mainAxisSize: MainAxisSize.min,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           userPhoto(author: article),
  //           SizedBox(
  //             width: 15,
  //           ),
  //           userInfo(userInfo: article),
  //           Spacer(
  //             flex: 1,
  //           ),
  //           topActionButt(
  //               customFields: article, upPress: () {}, downPress: () {})
  //         ]);
  // _buildTags({required ArticleModel article}) => Container(
  //       child: Row(
  //         children: List.generate(
  //           article.tags!.length,
  //           (index) => Container(
  //             color: lightGrey(),
  //             margin: EdgeInsets.only(left: 10),
  //             padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
  //             child: RichText(
  //               text: TextSpan(
  //                   text: '#${article.tags![index].name}',
  //                   style: textTheme.subtitle2),
  //             ),
  //           ),
  //         ),
  //       ),
  //     );
  // _buildButtonsAction(ArticleModel articleModel) => Row(
  //         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           answerBut(onPress: () {}),
  //           Spacer(
  //             flex: 1,
  //           ),
  //           Container(
  //             child: Row(
  //               children: [
  //                 viewsIcon(onPress: () {}),
  //                 viewsPeople(customFieldsModel: articleModel.customFields!),
  //               ],
  //             ),
  //           ),
  //           SizedBox(
  //             width: 10,
  //           ),
  //           Container(
  //             child: Row(
  //               children: [
  //                 commentIcon(onPress: () {}),
  //                 commentNumb(customFieldsModel: articleModel.customFields!),
  //               ],
  //             ),
  //           ),
  //           SizedBox(
  //             width: 10,
  //           ),
  //           faveIcon(onPress: () {})
  //         ]);
}
