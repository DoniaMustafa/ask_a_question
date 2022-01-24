import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:flutter/material.dart';

class DefaultButtonWidget extends StatelessWidget {
   DefaultButtonWidget({Key? key,required this.onPress,required this.text,this.width,this.height}) : super(key: key);
  final Function onPress;
  final String text;
   final double? width;
   final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      width:width,
      height:height ,
      child:  ElevatedButton(
        onPressed: () =>onPress(),
        child: RichText(
          text: TextSpan(
            style: textThemeData.textTheme.button,
            text: text,
          ),
        ),
      ),
    );
  }
}
