import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast({required String text, required ToastColors tColor,
  required ToastGravity gravity
}) {
  Fluttertoast.showToast(
      msg: '$text',
      toastLength: Toast.LENGTH_SHORT,
      fontSize: 16,
      backgroundColor: setToastColor(tColor),

      gravity:gravity
  );
}

enum ToastColors { SUCCESS, ERROR, WARNING }
setToastColor(ToastColors color) {
  Color basicColor;
  switch (color) {
    case ToastColors.SUCCESS:
      basicColor = Colors.green;
      break;
    case ToastColors.ERROR:
      basicColor = Colors.red;
      break;
    case ToastColors.WARNING:
      basicColor = Colors.yellow;

      break;
  }
  return basicColor;
}
