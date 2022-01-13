import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:flutter/material.dart';

class DefaultTextButtonWidget extends StatelessWidget {
  const DefaultTextButtonWidget({Key? key,required this.text,required this.onPressed}) : super(key: key);
  final VoidCallback? onPressed;
final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: Text(text),style: ButtonStyle(
      animationDuration: Duration(microseconds: 5000),
      textStyle: MaterialStateProperty.all(textThemeData.textTheme.button!)

    ),);
  }
}
