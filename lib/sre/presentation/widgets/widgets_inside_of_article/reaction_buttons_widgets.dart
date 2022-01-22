import 'package:discy_application/sre/config/color/def_color.dart';
import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:discy_application/sre/config/routes/route.dart';
import 'package:discy_application/sre/core/utils/const.dart';
import 'package:discy_application/sre/core/utils/toast.dart';
import 'package:discy_application/sre/di.dart';
import 'package:discy_application/sre/domain/entities/article/article.dart';
import 'package:discy_application/sre/presentation/bloc/fav_bloc/fav_cubit.dart';
import 'package:discy_application/sre/presentation/screens/single_post_screen.dart';
import 'package:discy_application/sre/presentation/widgets/default_but_widget.dart';
import 'package:discy_application/sre/presentation/widgets/default_circle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ReactionButtonsWidgets extends StatelessWidget {
  ReactionButtonsWidgets({Key? key, required this.article, this.i})
      : super(key: key);
  final Article article;
  final dynamic i;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      answerBut(onPress: () {}),
      Spacer(
        flex: 1,
      ),
      Container(
        child: Row(
          children: [
            viewsIcon(onPress: () {}),
            viewsPeople(text: article.customFields!.postStats![0].toString()),
          ],
        ),
      ),
      SizedBox(
        width: 10,
      ),
      Container(
        child: Row(
          children: [
            commentIcon(
                onPress: () {},
                context: context,
                id: article.id!,
                type: article.type!),
            commentNumb(
                text: article.customFields!.commentCount![0].toString()),
          ],
        ),
      ),
      SizedBox(
        width: 10,
      ),
      BlocProvider(
        create: (context) => di<FavCubit>(),
        child: BlocConsumer<FavCubit, FavState>(
          listener: (context, state) {
            if (state is FavLoadedAddAndRemoveFav) {
             return showToast(
                text: 'Done',gravity: ToastGravity.CENTER,tColor: ToastColors.SUCCESS
              );
            }
            if (state is FavErrorAddAndRemoveFav) {
              return showToast(
                  text: 'Error',gravity: ToastGravity.CENTER,tColor: ToastColors.SUCCESS
              );
            }
          },
          builder: (context, state) {
            if (state is FavLoadingAddAndRemoveFav) {
              return Container(
                width: 10,
                  height: 10
                  ,
                  child: CircularProgressIndicator());
            } else {
              return faveIcon(id: article.id!, onPress: ()=>di<FavCubit>().addAndRemoveOfFavorite(
                id: article.id!,
              ));
            }
          },
        ),
      )
    ]);
  }
}

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
Widget viewsPeople({required String text}) {
  return Container(
    child: RichText(
      text: TextSpan(
        style: textTheme.button!.copyWith(color: Colors.black),
        text: text,
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
Widget commentNumb({required String text}) {
  return Container(
    child: RichText(
      text: TextSpan(
        style: textTheme.button!.copyWith(color: Colors.black),
        text: text,
      ),
    ),
  );
}

Widget faveIcon({required int id, required Function onPress}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: DefaultCircleWidget(
        icon: Icons.bookmark_outline,
        r: 30.0,
        wd: 40,
        ht: 40,
        isIcon: true,
        iconSize: 20,
        iconColor: favorite[id] == true ? Colors.red : deepGrey(),
        onPress: ()=>onPress(),
      ),
    );
