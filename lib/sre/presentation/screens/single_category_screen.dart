import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:discy_application/sre/config/routes/route.dart';
import 'package:discy_application/sre/di.dart';
import 'package:discy_application/sre/domain/entities/article/article.dart';
import 'package:discy_application/sre/presentation/bloc/single_category_bloc/single_category_cubit.dart';
import 'package:discy_application/sre/presentation/screens/single_post_screen.dart';
import 'package:discy_application/sre/presentation/widgets/build_list_item_widget.dart';
import 'package:discy_application/sre/presentation/widgets/listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleCategoryScreen extends StatelessWidget {
  final int id;
  final String name;
  SingleCategoryScreen({required this.id, required this.name});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<SingleCategoryCubit>()..getSingleCategory(id: id),
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<SingleCategoryCubit, SingleCategoryState>(
            builder: (context, state) {
              return Text(
                '$name',
                style: textThemeData.textTheme.headline6,
              );
            },
          ),
        ),
        body: BlocBuilder<SingleCategoryCubit, SingleCategoryState>(
            builder: (context, state) {
          if (state is SingleCategorySuccessState &&
              state.articleResponseModel != null) {
            print(state.articleResponseModel!.articleModel!.length);
            return Container(
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, i) {
                    return _buildList(
                        article: state.articleResponseModel!.articleModel![i],
                        context: context);
                  },
                  separatorBuilder: (context, i) => Divider(),
                  itemCount: state.articleResponseModel!.articleModel!.length),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }

  _buildList({
    required Article article,
    required BuildContext context,
  }) =>
      Container(
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
          // if (article.thumbnail != null) image(img: article),
          // if (article.thumbnail != null) SizedBox(height: 20),
          GestureDetector(
              onTap: () => navigatorTo(
                  context: context,
                  widget: SingleQuestionScreen(
                    id: article.id!,
                    type: article.type!,
                  )),
              child: title(article: article)),
          SizedBox(height: 20),
          GestureDetector(
              onTap: () => navigatorTo(
                  context: context,
                  widget: SingleQuestionScreen(
                    id: article.id!,
                    type: article.type!,
                  )),
              child: content(articleModel: article)),
          buildTags(article: article, context: context),
          Divider(),
          buildButtonsAction(article,context)
        ]),
      );
}
