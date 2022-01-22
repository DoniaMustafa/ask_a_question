import 'package:discy_application/sre/domain/entities/article/article.dart';
import 'package:discy_application/sre/presentation/widgets/build_list_item_widget.dart';
import 'package:discy_application/sre/presentation/widgets/listview_widget.dart';
import 'package:discy_application/sre/presentation/widgets/widgets_inside_of_article/reaction_buttons_widgets.dart';
import 'package:discy_application/sre/presentation/widgets/widgets_inside_of_article/tags_widget.dart';
import 'package:flutter/material.dart';

class  CustomListOfArticle extends StatelessWidget {
    CustomListOfArticle({Key? key,required this.article,this.i}) : super(key: key);
  final Article article;
  final dynamic i;
  @override
  Widget build(BuildContext context) {
    return Container(
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
        TagsWidget(article: article, ),
        Divider(),
         ReactionButtonsWidgets(article: article,i: i,)
      ]),
    );
  }

}
