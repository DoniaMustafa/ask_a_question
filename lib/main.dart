import 'package:discy_application/sre/config/color/def_color.dart';
import 'package:discy_application/sre/di.dart';
import 'package:discy_application/sre/presentation/bloc/categories_bloc/category_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/drawer_bloc/drawer_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/fav_bloc/fav_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/answer_bloc/answer_ques_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/bump_bloc/bump_que_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/home_bloc/home_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/most_bloc/most_answer_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/no_answer_cubit/no_answer__qus_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/recent_bloc/recent_ques_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/recent_post_cubit/recent_post_ques_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/vote_cubit/vote_ques_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/layout_bloc/layout_cubit.dart';
import 'package:discy_application/sre/presentation/screens/layout_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependency();
  // var bloc = ObserverList();
  // print(bloc);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  //
  // @override
  // void dispose() {
  //   di<FavCubit>().stream.drain();
  //   super.dispose();
  // }


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => di<LayoutCubit>(),
          ),

          BlocProvider(
            create: (context) => di<RecentQuesCubit>()..getDataFromArticle(),
          ),
          BlocProvider(
            create: (context) => di<HomeCubit>(),
          ),
          BlocProvider(
            create: (context) => di<UserInfoCubit>()..getCurrentUser(),
          ),

          BlocProvider(
            create: (context) => di<MostAnswerCubit>()..getMostAnsw(),
          ),
          BlocProvider(
            create: (context) => di<BumpQueCubit>()..getBumpQueArticle(),
          ),
          BlocProvider(
            create: (context) => di<AnswerQuesCubit>()..getAnswerQuesArticle(),
          ),
          BlocProvider(
            create: (context) => di<MostVoteCubit>()..getMostVoteArticle(),
          ),
          BlocProvider(
            create: (context) => di<NoAnswerQusCubit>()..getNoAnswerArticle(),
          ), BlocProvider(
            create: (context) => di<RecentPostQuesCubit>()..getRecentPostArticle(),
          ),
          BlocProvider(
            create: (context) => di<CategoryCubit>()..getCategories(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor:Colors.white ,
            appBarTheme: AppBarTheme(
              elevation: 0.0,
              color: Colors.white,
              iconTheme: IconThemeData(

                color: deepGrey()
              )
            )
          ),
          home: BlocBuilder<LayoutCubit, LayoutState>(
            builder: (context, state) {
              return LayoutScreen();
            },
          ),
        ));
  }
}
