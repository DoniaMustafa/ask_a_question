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

Widget userInfo({required Article userInfo}) {
  return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              RichText(
                text: TextSpan(
                    text: userInfo.author!.name,
                    style: textTheme.subtitle1!
                        .copyWith(color: Colors.indigoAccent)),
              ),
              if (userInfo.author!.verified = true)
                SizedBox(
                  width: 5,
                ),
              if (userInfo.author!.verified = true)
                DefaultCircleWidget(
                  icon: Icons.done,
                  isIcon: true,
                  r: 17,
                  iconSize: 15,
                  circleColor: blue(),
                  wd: 50,
                  ht: 20,
                  iconColor: Colors.white,
                ),
            ],
          ),
          if (userInfo.categories != null)
            SizedBox(
              height: 8,
            ),
          if (userInfo.author!.badge!.color != "" ||
              userInfo.author!.badge!.name != "")
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
              alignment: Alignment.centerLeft,
              color: HexColor(
                  '${userInfo.author!.badge!.color != "" ? userInfo.author!.badge!.color : '#00000000'}'),
              child: userInfo.author!.badge!.name == null
                  ? Container()
                  : RichText(
                      text: TextSpan(
                          text: userInfo.author!.badge!.name,
                          style: textTheme.bodyText2!
                              .copyWith(color: Colors.white)),
                    ),
            ),
        ],
      ));
}

Widget userPhoto({required String author}) => DefaultCircleWidget(
      r2: 30,
      isIcon: false,
      width: 50,
      r: 0.0,
      height: 50,
      image: author.toString(),
      onPress: () {},
    );

Widget topActionButt({required Article customFields}) => BlocProvider(
      create: (context) => di<HomeCubit>(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Row(
            children: [
              buttonAction(
                  onPress: () => di<HomeCubit>().postVoteAction(
                      type: customFields.type!,
                      id: customFields.id!,
                      count: 'up')),
              customFields.customFields == null
                  ? Container()
                  : Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: RichText(
                        text: TextSpan(
                            text: customFields.customFields!.questionVote![0]
                                .toString(),
                            style: textTheme.caption),
                      ),
                    ),
              buttonAction(
                  onPress: () => di<HomeCubit>().postVoteAction(
                      type: customFields.type!,
                      id: customFields.id!,
                      count: 'down'))
            ],
          );
        },
      ),
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
Widget buildTags({
  required Article article,
  required BuildContext context,
}) =>
    Container(
      child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              childAspectRatio: 1.9/ 0.7,
              children: List.generate(
                article.tags!.length,
                (index) => GestureDetector(
                  onTap: () {
                    print(article.tags![index].id);
                    print(article.tags![index].name);

                    navigatorTo(
                    context: context,
                    widget: SingleCategoryScreen(
                        id: article.tags![index].id,
                        name: article.tags![index].name.toString()),
                  );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: lightGrey(),
                        borderRadius: BorderRadius.circular(20.0)),
                    padding: EdgeInsets.symmetric(horizontal: 2, ),
                    child: Text(
                      '#${article.tags![index].name}',
                      style: textTheme.caption,
                    ),
                  ),
                ),
              ),
            ),
    );

Widget answerBut({required Function onPress}) => DefaultButtonWidget(
      onPress: () => onPress,
      text: 'Answer',
    );
Widget viewsIcon({required Function onPress}) => DefaultCircleWidget(
      icon: Icons.remove_red_eye_outlined,
      r: 20,
      wd: 40,
      ht: 40,
      isIcon: true,
      iconSize: 20,
      onPress: () => onPress,
    );
Widget viewsPeople({required CustomFields customFieldsModel}) {
  return Container(
    child: customFieldsModel == null
        ? Container()
        : RichText(
            text: TextSpan(
              style: textTheme.button!.copyWith(color: Colors.black),
              text: customFieldsModel.postStats![0].toString(),
            ),
          ),
  );
}

Widget commentIcon(
        {required Function onPress,
        required context,
        required int id,
        required String type}) =>
    DefaultCircleWidget(
      icon: Icons.question_answer_outlined,
      r: 20,
      wd: 40,
      ht: 40,
      isIcon: true,
      iconSize: 20,
      onPress: () => navigatorTo(
          context: context,
          widget: SingleQuestionScreen(
            id: id,
            type: type,
          )),
    );
Widget commentNumb({required CustomFields customFieldsModel}) {
  return Container(
    child: RichText(
      text: TextSpan(
        style: textTheme.button!.copyWith(color: Colors.black),
        text: customFieldsModel.commentCount![0].toString(),
      ),
    ),
  );
}

Widget faveIcon({required Article article}) =>  BlocProvider(
  create: (context) =>
      di<FavCubit>(),
  child: BlocConsumer<FavCubit, FavState>(
  listener: (context, state) {
    if (state is  FavChangeAction){
      Fluttertoast.showToast(msg: 'add',gravity: ToastGravity.CENTER,fontSize: 50.0,textColor: Colors.black);}

  },
  builder: (context, state) {
    return Stack(
      children: [
        DefaultCircleWidget(
            icon: Icons.bookmark_outline,
            r: 30.0,
            wd: 40,
            ht: 40,
            isIcon: true,
            iconSize: 20,
            iconColor:
            favorite[article.id!]!=true ? Colors.green :deepGrey(),
            onPress: () =>
                di<FavCubit>().select(id: article.id!)
        ),
      ],
    );


  },
),
);
Widget buttonAction({required onPress}) => DefaultCircleWidget(
    icon: Icons.arrow_drop_up,
    r: 20,
    width: 35,
    height: 35,
    iconSize: 25,
    circleColor: lightGrey(),
    isIcon: true,
    onPress: () => onPress);
