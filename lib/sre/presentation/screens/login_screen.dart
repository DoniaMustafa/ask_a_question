import 'package:discy_application/sre/config/routes/route.dart';
import 'package:discy_application/sre/core/utils/toast.dart';
import 'package:discy_application/sre/presentation/bloc/login_bloc/login_cubit.dart';
import 'package:discy_application/sre/presentation/screens/layout_screen.dart';
import 'package:discy_application/sre/presentation/widgets/forgot_pass_widgets.dart';
import 'package:discy_application/sre/presentation/widgets/login_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../di.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: SafeArea(
          child: Column(

            children: [


              Container(alignment: Alignment.bottomCenter,
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [SizedBox(height: 200,),
                    buildImageWidget(),
                    SizedBox(height: 50.0
                      ,),
                    Form(key: di<LoginCubit>().key, child: textFormField()),
                    forgotPass(context),
                    SizedBox(
                      height: 50.0,
                    ),
                    BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {
                        if(state is LoginSuccessState){
                          navigatorTo(context: context, widget: LayoutScreen());
                        }
                        if(state is LoginErrorState){
                          showToast(text: 'userName or Password is validate', tColor: ToastColors.WARNING, gravity: ToastGravity.CENTER);
                        }
                      },
                      builder: (context, state) {
                        return defaultButton();
                      },
                    ),


                  ],
                ),
              ), Spacer(flex: 1,),
              signUp(),
            ],
          ),
        ),
      ),
    );
  }
}
