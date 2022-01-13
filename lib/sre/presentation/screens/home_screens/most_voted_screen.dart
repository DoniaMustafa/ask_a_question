import 'package:discy_application/sre/config/color/def_color.dart';
import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:discy_application/sre/data/model/article/article_model.dart';
import 'package:discy_application/sre/domain/entities/article/article.dart';
import 'package:discy_application/sre/domain/entities/article/category.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/vote_cubit/vote_ques_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/layout_bloc/layout_cubit.dart';
import 'package:discy_application/sre/presentation/widgets/build_list_item_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:discy_application/sre/presentation/widgets/listview_widget.dart';
import 'package:flutter/material.dart';

class MostVotedScreen extends StatelessWidget {
  const MostVotedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MostVoteCubit, MostVoteState>(
        builder: (context, state) {
          if (state is MostVoteSuccessState &&
              state.articleModel != null){
            print( state.articleModel!.articleModel!.length);
            return Container(
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, i) {
                    print( state.articleModel!.articleModel![i].categories);
                    return _buildList(article: state.articleModel!.articleModel![i],context: context);
                  },
                  separatorBuilder: (context, i) => Divider(),
                  itemCount: state.articleModel!.articleModel!.length),
            );}else{

            return Center(child: CircularProgressIndicator());
          }
        });
  }

  _buildList({required Article article,required context}) =>  Container(
    padding: EdgeInsets.all(15),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildCategAndDate(
            article: article,context:context),
          SizedBox(
            height: 15,
          ),
          buildUserInfo(article),
          SizedBox(height: 20),
          title(article: article),
          SizedBox(height: 20),
          content(articleModel:article),
          buildTags(article: article,context:context),
          Divider(),
          buildButtonsAction(article,context)
        ]),
  );
  //
  // _buildCategAndDate({required List<Category> categories,required Article article}) =>
  //     Row(children: [
  //
  //
  //       category(categories: categories, onPress: () {}),
  //       dateTime(dateTime: article),
  //       Spacer(
  //         flex: 1,
  //       ),
  //       flagCircle(onPress: () {}),
  //     ]);
  // _buildUserInfo(Article article)=>Row(
  //     mainAxisSize: MainAxisSize.min,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       userPhoto(author: article.author),
  //       SizedBox(
  //         width: 15,
  //       ),
  //       userInfo(userInfo:  article.author ),
  //       Spacer(flex: 1,),
  //       topActionButt(customFields: article, upPress: (){}, downPress: (){})
  //     ]
  // );
  // _buildTags({required Article article})=> Container(
  //   child: Row(
  //     children: List.generate(
  //       article.tags!.length,
  //           (index) => Container(
  //         color: lightGrey(),
  //         margin: EdgeInsets.only(left: 10),
  //         padding:
  //         EdgeInsets.symmetric(horizontal: 5, vertical: 5),
  //         child: RichText(
  //           text: TextSpan(
  //               text: '#${article.tags![index].name}', style: textTheme.subtitle2),
  //         ),
  //       ),
  //     ),
  //   ),
  // );
  // _buildButtonsAction(Article articleModel)=>Row(
  //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       answerBut(onPress: (){}),
  //       Spacer(flex: 1,),
  //       Container(child: Row(children: [  viewsIcon(onPress: (){}),
  //         viewsPeople(
  //             customFieldsModel:articleModel.customFields! ),],),),
  //       SizedBox(width: 10,),
  //       Container(child: Row(children: [
  //         commentIcon(onPress: (){}),
  //         commentNumb(customFieldsModel: articleModel.customFields! ),
  //       ],),), SizedBox(width: 10,),
  //       faveIcon(onPress: (){})
  //
  //     ]
  // );


}

