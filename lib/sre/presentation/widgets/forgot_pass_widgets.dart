import 'package:discy_application/sre/config/color/def_color.dart';
import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:discy_application/sre/core/utils/toast.dart';
import 'package:discy_application/sre/presentation/bloc/login_bloc/login_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../di.dart';
import 'default_but_widget.dart';
import 'default_text_form_widget.dart';

Widget buildImageWidget() => Container(
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/GUI/img.png'),
        ),
      ),
    );
Widget buildContentWidget() => RichText(
      textAlign: TextAlign.center,
      text: TextSpan(style: textThemeData.textTheme.caption, children: [
        TextSpan(text: 'Forgot your Password?\n'),
        TextSpan(text: '\nEnter the email address associated with your account')
      ]),
    );
Widget buildFormFieldWidget() => DefaultTextFormField(
    txtValid: 'enter your email',
    textType: TextInputType.emailAddress,
    controller: di<LoginCubit>().controller!,
    isPass: false,
    txt: 'Email');
Widget buildResetWidget() => BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    if(state is LoginForgotPassSuccessState&& state.state== true){
      showToast(text: 'Check your email', tColor: ToastColors.SUCCESS, gravity: ToastGravity.BOTTOM);
    }

  },
  builder: (context, state) {
    return Stack(
      alignment: Alignment.center,
      children: [
        buildResetButWidget(),
        if(state is LoginForgotPassLoadingState)
          CircularProgressIndicator(color: deepGrey(),),
      ],
    );
  },
);



Widget buildResetButWidget()=>  DefaultButtonWidget(
      text: 'Reset Password',
      onPress: () {
        print('s');
         di<LoginCubit>().forgotPass(di<LoginCubit>().controller!.text);
      },
      width: double.infinity,
      height: 50,
    );
