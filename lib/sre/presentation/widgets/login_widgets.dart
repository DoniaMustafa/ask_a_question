import 'package:discy_application/sre/config/color/def_color.dart';
import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:discy_application/sre/config/routes/route.dart';
import 'package:discy_application/sre/di.dart';
import 'package:discy_application/sre/presentation/bloc/login_bloc/login_cubit.dart';
import 'package:discy_application/sre/presentation/screens/forgot_pass_screen.dart';
import 'package:discy_application/sre/presentation/widgets/default_but_widget.dart';
import 'package:discy_application/sre/presentation/widgets/default_text_button_widget.dart';
import 'package:discy_application/sre/presentation/widgets/default_text_form_widget.dart';
import 'package:flutter/material.dart';




Widget textFormField() => Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DefaultTextFormField(
          txtValid: 'username is validate',
          textType: TextInputType.emailAddress,
          controller: di<LoginCubit>().controller!,
          isPass: false,
          txt: 'UserName',
          prefixIcon: Icons.email,
        ),
        SizedBox(
          height: 20.0,
        ),
        DefaultTextFormField(
            txtValid: 'password is validate',
            textType: TextInputType.visiblePassword,
            controller: di<LoginCubit>().passController!,
            isPass: di<LoginCubit>().isShow,
            txt: 'Password',
            prefixIcon: Icons.lock,
            suffixIcon: di<LoginCubit>().isShow
                ? Icons.visibility_off:Icons.visibility,
            onPress: () => di<LoginCubit>().changeSuffix()),
      ],
    );
Widget defaultButton(
) =>
    DefaultButtonWidget(
      onPress: () {
        print('d');
        if (di<LoginCubit>().key.currentState!.validate()) {
          print(di<LoginCubit>().controller!.text);
          return di<LoginCubit>().login(
              userName: di<LoginCubit>().controller!.text,
              pass: di<LoginCubit>().passController!.text);
        }
        return null;
      },
      text: 'Login',
      width: double.infinity,
      height: 50.0,
    );
Widget signUp() => Container(
      width: double.infinity,
      alignment: Alignment.center,
      height: 70,
      decoration: BoxDecoration(
          color: lightGrey(),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                100.0,
              ),
              topRight: Radius.circular(
                100.0,
              ))),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: 'Don’t you have account?',
              style: textThemeData.textTheme.subtitle1!),
          TextSpan(
              text: ' Sign Up',
              style:
                  textThemeData.textTheme.subtitle1!.copyWith(color: blue())),
        ]),
      ),
    );
Widget forgotPass(context) => Container(
      alignment: Alignment.centerRight,
      child: DefaultTextButtonWidget(
        text: 'Forgot Password?',
        onPressed: () =>
            navigatorTo(context: context, widget: ForgotPassScreen()),
      ),
    );
