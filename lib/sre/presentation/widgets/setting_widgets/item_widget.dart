import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:flutter/material.dart';

Widget defaultItem(
    {required String txt,
    Color color = Colors.black,
     IconData? icon,
    iconSize = 15.0}) {
  return Container(
    width: double.infinity,
    height: 40,
    child: Row(
      children: [
        Text('$txt',style: textTheme.subtitle1,),
        Spacer(
          flex: 1,
        ),
        Icon(icon,size: 15,)
      ],
    ),
  );
}
