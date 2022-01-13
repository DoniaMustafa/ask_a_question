import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:flutter/material.dart';

class DefaultButtonWidget extends StatelessWidget {
  const DefaultButtonWidget({Key? key,required this.onPress,required this.text}) : super(key: key);
  final Function onPress;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  ElevatedButton(
        onPressed: () =>onPress(),
        child: RichText(
          text: TextSpan(
            style: textTheme.button,
            text: text,
          ),
        ),
      ),
    );
  }
}
