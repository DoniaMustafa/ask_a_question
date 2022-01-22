import 'package:discy_application/sre/config/color/def_color.dart';
import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:discy_application/sre/config/routes/route.dart';
import 'package:discy_application/sre/domain/entities/article/article.dart';
import 'package:discy_application/sre/presentation/screens/single_category_screen.dart';
import 'package:discy_application/sre/presentation/screens/tag_screen.dart';
import 'package:flutter/material.dart';

class TagsWidget extends StatelessWidget {
  const TagsWidget({Key? key, required this.article}) : super(key: key);
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        childAspectRatio: 1.9 / 0.7,
        children: List.generate(
          article.tags!.length,
          (index) => GestureDetector(
            onTap: () {
              print(article.tags![index].id);
              print(article.tags![index].name);

              navigatorTo(
                context: context,
                widget: TagScreen(
                    id: article.tags![index].id,
                    taxonomy: article.tags![index].taxonomy,
                    name: article.tags![index].name.toString()),
              );
            },
            child: _buildTags(index),
          ),
        ),
      ),
    );
  }

  _buildTags(int index) => Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: lightGrey(), borderRadius: BorderRadius.circular(20.0)),
        padding: EdgeInsets.symmetric(
          horizontal: 2,
        ),
        child: Text(
          '#${article.tags![index].name}',
          style: textTheme.caption,
        ),
      );
}
