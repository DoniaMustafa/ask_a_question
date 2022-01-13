import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:discy_application/sre/core/utils/const.dart';
import 'package:discy_application/sre/di.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/recent_bloc/recent_ques_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/layout_bloc/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   bottom:PreferredSize(
      //     child: _buildTabBar(),
      //     preferredSize: Size.fromHeight(40.0),
      //   ),
      //
      // ),
      body: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          return TabBarView(
            controller: di<LayoutCubit>().tabController,
            children: screen,
          );
        },
      ),
    );
  }
  _buildTabBar() => TabBar(
      controller: di<LayoutCubit>().tabController,
      isScrollable: true,
      indicatorWeight: 5.0,
      indicatorColor: Colors.grey[500],
      tabs: di<LayoutCubit>()
          .tabsTitle
          .map(
            (e) => Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            e.toString(),
            style: textTheme.subtitle2,
          ),
        ),
      )
          .toList());

}
