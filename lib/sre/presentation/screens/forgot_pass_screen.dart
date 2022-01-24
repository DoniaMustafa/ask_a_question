import 'package:discy_application/sre/config/color/def_color.dart';
import 'package:discy_application/sre/core/utils/toast.dart';
import 'package:discy_application/sre/presentation/bloc/login_bloc/login_cubit.dart';
import 'package:discy_application/sre/presentation/widgets/forgot_pass_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPassScreen extends StatelessWidget {
  const ForgotPassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildImageWidget(),
          SizedBox(
            height: 30.0,
          ),
          buildContentWidget(),
          SizedBox(
            height: 20.0,
          ),
          buildFormFieldWidget(),
          SizedBox(
            height: 20.0,
          ),
          buildResetWidget()
        ],
      ),
    );
  }
}
