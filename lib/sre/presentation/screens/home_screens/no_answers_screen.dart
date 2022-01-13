import 'package:discy_application/sre/config/color/def_color.dart';
import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:discy_application/sre/data/model/article/article_model.dart';
import 'package:discy_application/sre/domain/entities/article/article.dart';
import 'package:discy_application/sre/domain/entities/article/category.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/no_answer_cubit/no_answer__qus_cubit.dart';
import 'package:discy_application/sre/presentation/widgets/build_list_item_widget.dart';
import 'package:discy_application/sre/presentation/widgets/listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoAnswersScreen extends StatelessWidget {
  const NoAnswersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoAnswerQusCubit, NoAnswerQusState>(
        builder: (context, state) {
          if (state is NoAnswerSuccessState &&
              state.articleModel != null){
            print( state.articleModel!.articleModel!.length);
            return Container(
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, i) {
                    print( state.articleModel!.articleModel![i].categories);
                    return _buildList(article: state.articleModel!.articleModel![i],context:context);
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
          buildCategAndDate(article: article,context: context),
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


}
