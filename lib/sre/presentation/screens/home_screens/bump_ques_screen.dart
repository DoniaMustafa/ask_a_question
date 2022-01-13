import 'package:discy_application/sre/di.dart';
import 'package:discy_application/sre/domain/entities/article/article.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/bump_bloc/bump_que_cubit.dart';
import 'package:discy_application/sre/presentation/widgets/build_list_item_widget.dart';
import 'package:discy_application/sre/presentation/widgets/default_text_button_widget.dart';
import 'package:discy_application/sre/presentation/widgets/listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BumpQuestionScreen extends StatelessWidget {
  const BumpQuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<BumpQueCubit, BumpQueState>(builder: (context, state) {
        if (state is BumpQueSuccessState &&
            state.articleResponseModel != null) {
          print(state.articleResponseModel.articleModel!.length);
          return Column(
            children: [
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    // print( state.articleResponseModel.articleModel![i].categories);
                    return _buildList(
                        article: state.articleResponseModel.articleModel![i],
                        context: context);
                  },
                  separatorBuilder: (context, i) => Divider(),
                  itemCount: state.articleResponseModel.articleModel!.length),
              if (di<BumpQueCubit>().currentPage <=
                  state.articleResponseModel.pages!)
                Container(
                  child:state is ! MoreBumpQueLoadingState? DefaultTextButtonWidget(
                    text: 'Load More...',
                    onPressed: () {
                      if (di<BumpQueCubit>().currentPage <=
                          state.articleResponseModel.pages!) {
                        print('currentPage : ${di<BumpQueCubit>().currentPage}');
                        print('pages : ${state.articleResponseModel.pages!}');

                        di<BumpQueCubit>().getMoreBumpQusFromArticle();
                      } else {
                        Container(child: Text('No more data'));
                      }
                    },
                  ):CircularProgressIndicator(),
                ),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }),
    );
  }

  _buildList({required Article article, required context}) => Container(
        padding: EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          buildCategAndDate(
            context: context,
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
          buildTags(article: article, context: context),
          Divider(),
          buildButtonsAction(article, context)
        ]),
      );

  // _buildCategAndDate({required List<CategoryModel> categories,required ArticleModel article}) =>
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
  // _buildUserInfo(ArticleModel article)=>Row(
  //     mainAxisSize: MainAxisSize.min,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       userPhoto(author: article),
  //       SizedBox(
  //         width: 15,
  //       ),
  //       userInfo(userInfo:  article ),
  //       Spacer(flex: 1,),
  //       topActionButt(customFields: article, upPress: (){}, downPress: (){})
  //     ]
  // );
  // _buildTags({required ArticleModel article})=> Container(
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
  // _buildButtonsAction(ArticleModel articleModel)=>Row(
  //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       answerBut(onPress: (){}),
  //       Spacer(flex: 1,),
  //       Container(child: Row(children: [  viewsIcon(onPress: (){}),
  //         viewsPeople(customFieldsModel:articleModel.customFields! ),],),),
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
