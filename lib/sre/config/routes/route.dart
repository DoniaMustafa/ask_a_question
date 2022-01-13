import 'package:flutter/material.dart';

navigatorTo({required BuildContext context, required Widget widget, child}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

navigatorAndFinish({required BuildContext context, required Widget widget}) =>
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => widget), (route) => false);
