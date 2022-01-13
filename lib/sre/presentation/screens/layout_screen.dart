import 'package:discy_application/sre/config/color/def_color.dart';
import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:discy_application/sre/config/routes/route.dart';
import 'package:discy_application/sre/di.dart';
import 'package:discy_application/sre/presentation/bloc/layout_bloc/layout_cubit.dart';
import 'package:discy_application/sre/presentation/screens/search_screen.dart';
import 'package:discy_application/sre/presentation/widgets/drawer_wedgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatefulWidget {
  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen>with SingleTickerProviderStateMixin  {

  @override
  void initState() {
    super.initState();
    di<LayoutCubit>().tabController =
        TabController(length: 7, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    di<LayoutCubit>().tabController!.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
        bottomNavigationBar: _buildBottomBar(),

    body: SafeArea(child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: di<LayoutCubit>().titleScreen[di<LayoutCubit>().select],
                actions: [
                  IconButton(
                    icon: di<LayoutCubit>().screens[di<LayoutCubit>().select] !=
                            di<LayoutCubit>().screens[0]
                        ? Container()
                        : Icon(
                            Icons.search,
                            color: deepGrey(),size: 30,
                          ),
                    onPressed: ()=>navigatorTo(context: context, widget: SearchScreen()),
                  ),
                ],
              bottom: PreferredSize(
                child: di<LayoutCubit>().select==0 ?_buildTabBar():Container(),
                preferredSize:di<LayoutCubit>().select==0 ? Size.fromHeight(48.0):Size.fromHeight(0.0),
              ),
            ),
      SliverFillRemaining(
        child: di<LayoutCubit>().screens[di<LayoutCubit>().select],
      )
      ],        ),)
      // backgroundColor: Colors.white,
      // drawer: DrawerWidget(),
      // appBar: AppBar(
      //
      //   iconTheme: IconThemeData(color: Colors.black),
      //   backgroundColor: Colors.white,
      //   title: di<LayoutCubit>().titleScreen[di<LayoutCubit>().select],
      //   actions: [
      //     IconButton(
      //       icon: di<LayoutCubit>().screens[di<LayoutCubit>().select] !=
      //               di<LayoutCubit>().screens[0]
      //           ? Container()
      //           : Icon(
      //               Icons.search,
      //               color: Colors.black54,
      //             ),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      // body: di<LayoutCubit>().screens[di<LayoutCubit>().select],
      // bottomNavigationBar: _buildBottomBar(),
    );
  }

  _buildBottomBar() => BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
            backgroundColor: Colors.deepPurple,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline),
            label: 'Favorite',
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        onTap: (itm) => di<LayoutCubit>().onClickBottomBar(itm),
        currentIndex: di<LayoutCubit>().select,
        fixedColor: Colors.deepPurple,
      );
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
