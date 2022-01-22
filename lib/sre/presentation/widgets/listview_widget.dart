import 'package:discy_application/sre/config/color/def_color.dart';
import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:discy_application/sre/config/routes/route.dart';
import 'package:discy_application/sre/core/utils/const.dart';
import 'package:discy_application/sre/di.dart';
import 'package:discy_application/sre/domain/entities/article/article.dart';
import 'package:discy_application/sre/domain/entities/article/category.dart';
import 'package:discy_application/sre/domain/entities/article/custom_fields.dart';
import 'package:discy_application/sre/presentation/bloc/fav_bloc/fav_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/home_bloc/home_cubit.dart';
import 'package:discy_application/sre/presentation/screens/single_category_screen.dart';
import 'package:discy_application/sre/presentation/screens/single_post_screen.dart';
import 'package:discy_application/sre/presentation/widgets/default_but_widget.dart';
import 'package:discy_application/sre/presentation/widgets/default_circle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

Widget category(
        {required List<Category> categories,
        required Function onPress,
        required context}) =>
    GestureDetector(
      onTap: () => navigatorTo(
        context: context,
        widget: SingleCategoryScreen(
            id: categories[0].id!.toInt(),
            name: categories[0].name!.toString()),
      ),
      child: RichText(
        text: TextSpan(
          text: '${categories[0].name} -',
          style: textThemeData.textTheme.caption!.copyWith(color: Colors.black),
        ),
      ),
    );

Widget dateTime({required Article dateTime}) => RichText(
      text: TextSpan(
          text: ' Asked at ${dateTime.date}',
          style: textThemeData.textTheme.caption),
    );

Widget flagCircle({required Function onPress}) => DefaultCircleWidget(
      icon: Icons.assistant_photo_outlined,
      r: 0,
      isIcon: true,
      ht: 25,
      wd: 35,
      iconSize: 20,
      onPress: () => onPress,
    );


Widget userPhoto({required String author}) => DefaultCircleWidget(
      r2: 30,
      isIcon: false,
      width: 50,
      r: 0.0,
      height: 50,
      image: author.toString(),
      onPress: () {},
    );


Widget title({required Article article}) => RichText(
      text: TextSpan(
        style: textTheme.headline6,
        text: article.title.toString(),
      ),
    );
Widget content({required Article articleModel}) => Container(
      child: Html(
        data: articleModel.content,
        style: {
          'body': Style.fromTextStyle(textThemeData.textTheme.bodyText2!)
        },
      ),
    );
// Widget buildTags({
//   required Article article,
//   required BuildContext context,
// }) =>

Widget buttonAction({required onPress}) => DefaultCircleWidget(
    icon: Icons.arrow_drop_up,
    r: 20,
    width: 35,
    height: 35,
    iconSize: 25,
    circleColor: lightGrey(),
    isIcon: true,
    onPress: () => onPress);
