import 'package:discy_application/sre/config/color/def_color.dart';
import 'package:flutter/material.dart';

class DefaultCircleWidget extends StatelessWidget {
  DefaultCircleWidget(
      {this.r ,
      this.r2 ,
      this.iconSize = 25,
      this.wd,
      this.ht,
      this.circleColor,
      this.icon,
      this.iconColor = const Color(0xFF4C4C50),
      this.onPress,
      this.isIcon = false,
      this.image,
      this.width,
      this.height});

  final bool isIcon;
  final double? r;
  final double? r2;

  final double iconSize;
  Color? circleColor;
  final IconData? icon;
  Color? iconColor;
  final  onPress;
  final String? image;
  final double? wd;
  final double? ht;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width :width,
      height:height ,
      decoration: BoxDecoration(
        color: circleColor,
        borderRadius: BorderRadius.circular(r!),
      ),
      child: GestureDetector(
        onTap: ()=> onPress!(),
        child: isIcon
            ? Icon(
                icon,
                color: iconColor,
                size: iconSize,
              )
            : Container(
                width: wd,
                height: ht,
                decoration: BoxDecoration(
                    color: circleColor,
                    borderRadius: BorderRadius.circular(r2!),
                    image: DecorationImage(
                        image: NetworkImage(
                      image!,
                    ))),
              ),
      ),
    );
  }
}
