import 'package:discy_application/sre/config/color/def_color.dart';
import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final Function? onPress;
  final bool isPass;
  final String txt;
  final String txtValid;

  final change;
  final String? hint;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final TextInputType textType;
  DefaultTextFormField(
      {required this.txtValid,
      required this.textType,
      required this.controller,
      this.onPress,
      required this.isPass,
      required this.txt,
      this.change,
      this.hint,
      this.suffixIcon,
      this.prefixIcon})
      : super();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPass ? true : false,
      onChanged: change,
      style: textThemeData.textTheme.caption,

      controller: controller,
      keyboardType: textType,
      validator: (String? value) {
      if(value!.isEmpty){
        return txtValid;
      }},
      decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () => onPress!(),
            icon: Icon(
              suffixIcon,
              size: 20.0,
              color: deepGrey(),
            ),
          ),
          label: Text(txt,style: textThemeData.textTheme.subtitle1,),
          filled: true,
          fillColor: lightGrey(),
          hintText: hint,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none),
          prefixIcon: Icon(
            prefixIcon,
            size: 20,
            color: blue(),
          )),
    );
  }
}
