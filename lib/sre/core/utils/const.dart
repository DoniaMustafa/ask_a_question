import 'package:discy_application/sre/di.dart';
import 'package:discy_application/sre/presentation/bloc/drawer_bloc/drawer_cubit.dart';
import 'package:discy_application/sre/presentation/screens/home_screens/answers_screen.dart';
import 'package:discy_application/sre/presentation/screens/home_screens/bump_ques_screen.dart';
import 'package:discy_application/sre/presentation/screens/home_screens/most_ans_screen.dart';
import 'package:discy_application/sre/presentation/screens/home_screens/most_voted_screen.dart';
import 'package:discy_application/sre/presentation/screens/home_screens/no_answers_screen.dart';
import 'package:discy_application/sre/presentation/screens/home_screens/recent_posts_screen.dart';
import 'package:discy_application/sre/presentation/screens/home_screens/recent_ques_screen.dart';
import 'package:flutter/material.dart';
Map<int, bool> favorite = {};
class CircleDrawerHeader{
  final String num;
  final IconData icon;

  CircleDrawerHeader({required this.num,required this.icon});
}
List <CircleDrawerHeader> container= [
  CircleDrawerHeader(num: di<UserInfoCubit>().responseCurrentUserModel!.user!.followers.toString(), icon: Icons.group),
  CircleDrawerHeader(num:  di<UserInfoCubit>().responseCurrentUserModel!.user!.questions.toString() , icon: Icons.contact_page_rounded),
  CircleDrawerHeader(num:  di<UserInfoCubit>().responseCurrentUserModel!.user!.notifications.toString(), icon: Icons.notifications),
];

class ListOfDrawer{
  final String title;
  final IconData iconLead;
  final IconData iconTrail;

  ListOfDrawer({ required this.title,required this.iconLead,required this.iconTrail});
}

List <ListOfDrawer> listDrawer=[
  ListOfDrawer(title: 'Home', iconLead:  Icons.home_outlined, iconTrail: Icons.arrow_forward_ios),
  ListOfDrawer(title: 'Ask Question', iconLead:Icons.border_color, iconTrail: Icons.arrow_forward_ios),
  ListOfDrawer(title: 'Category', iconLead: Icons.check_box_outline_blank_outlined, iconTrail: Icons.arrow_forward_ios),
  ListOfDrawer(title: 'Favorite', iconLead:Icons.bookmark_outline , iconTrail: Icons.arrow_forward_ios),
  ListOfDrawer(title: 'Setting', iconLead: Icons.settings_outlined, iconTrail: Icons.arrow_forward_ios),
  ListOfDrawer(title: 'Blog', iconLead: Icons.article_outlined, iconTrail: Icons.arrow_forward_ios),
  ListOfDrawer(title: 'Add Post', iconLead: Icons.post_add, iconTrail: Icons.arrow_forward_ios),
  ListOfDrawer(title: 'Badges and points', iconLead: Icons.wine_bar, iconTrail: Icons.arrow_forward_ios),
  ListOfDrawer(title: 'Logout', iconLead:Icons.logout , iconTrail: Icons.arrow_forward_ios ),
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
