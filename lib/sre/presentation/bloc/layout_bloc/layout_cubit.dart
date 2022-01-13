import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:discy_application/sre/data/model/article/article_response_model.dart';
import 'package:discy_application/sre/domain/repositories/article_repo.dart';
import 'package:discy_application/sre/presentation/screens/category_SCREEN.dart';
import 'package:discy_application/sre/presentation/screens/favorite_screen.dart';
import 'package:discy_application/sre/presentation/screens/home_screen.dart';
import 'package:discy_application/sre/presentation/screens/home_screens/answers_screen.dart';
import 'package:discy_application/sre/presentation/screens/home_screens/bump_ques_screen.dart';
import 'package:discy_application/sre/presentation/screens/home_screens/most_ans_screen.dart';
import 'package:discy_application/sre/presentation/screens/home_screens/most_voted_screen.dart';
import 'package:discy_application/sre/presentation/screens/home_screens/no_answers_screen.dart';
import 'package:discy_application/sre/presentation/screens/home_screens/recent_posts_screen.dart';
import 'package:discy_application/sre/presentation/screens/home_screens/recent_ques_screen.dart';
import 'package:discy_application/sre/presentation/screens/setting_screen.dart';
import 'package:flutter/material.dart';
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitialState());
  TabController? tabController;

  List<Widget>screens=[
    HomeScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    SettingScreen()
  ];

  List<Widget>screen = [
    RecentQuestionsScreen(),
    MostAnsweredScreen(),
    BumpQuestionScreen(),
    AnswersScreen(),
    MostVotedScreen(),
    NoAnswersScreen(),
    RecentPostsScreen()
  ];

  List<Widget> titleScreen = [
    Image.asset(
      'assets/GUI/img.png',
      width: 120,
      height: 50,
      fit: BoxFit.cover,
    ),
    Text(
      'Categories',
      style: textTheme.headline5,
    ),
    Text(
      'Favorite',
      style: textTheme.headline5,
    ),
    Text(
      'Settings',
      style: textTheme.headline5,
    ),
  ];

  List<String> tabsTitle = [
    'Recent Questions',
    'Most Answered',
    'Bump Question',
    'Answers',
    'Most Voted',
    'No Answers',
    'Recent Posts'
  ];
  ArticleResponseModel? articleModel;
  int selection = 0;
  int select = 0;

  click(index) {
    selection = index;
    emit(ChangeItemInitialStates());
  }
  onClickBottomBar(index) {
    select = index;
    emit(ChangeItemOfBottomBarStates());
  }

}
