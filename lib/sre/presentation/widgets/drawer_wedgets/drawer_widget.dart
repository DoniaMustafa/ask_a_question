import 'package:discy_application/sre/config/color/def_color.dart';
import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:discy_application/sre/core/utils/const.dart';
import 'package:discy_application/sre/di.dart';
import 'package:discy_application/sre/presentation/bloc/drawer_bloc/drawer_cubit.dart';
import 'package:discy_application/sre/presentation/widgets/default_circle_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          children: [
            Container(
              child: BlocBuilder<UserInfoCubit, UserInfoState>(
                builder: (context, state) {
                  if (state is UserInfoSuccess &&
                      state.responseCurrentUserModel != null) {
                    return DefaultCircleWidget(
                      r: 0.0,
                      onPress: () {},
                      isIcon: false,
                      r2: 25.0,
                      // width: 50,
                      wd: 40,
                      // height: 40,
                      ht: 40,
                      image: di<UserInfoCubit>()
                          .responseCurrentUserModel!
                          .user!
                          .avatar
                          .toString(),
                    );
                  } else {
                    return DefaultCircleWidget(
                      r: 0.0,
                      onPress: () {},
                      isIcon: false,
                      r2: 25.0,
                      // width: 50,
                      wd: 40,
                      // height: 40,
                      ht: 40,
                      image: 'assets/GUI/user.png',
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                    container.length,
                    (index) => BlocBuilder<UserInfoCubit, UserInfoState>(
                          builder: (context, state) {
                            return _buildCircleHeader(
                              container[index].icon,
                              container[index].num,
                            );
                          },
                        )),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Column(
              children: List.generate(
                  listDrawer.length,
                  (index) => _buildListOfDrawer(listDrawer[index].title,
                      listDrawer[index].iconLead, listDrawer[index].iconTrail)),
            ),
          ],
        ),
      ),
    );
  }

  _buildCircleHeader(IconData icon, String txt) => Container(
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(20.0)
        // ),
        child: Row(
          children: [
            DefaultCircleWidget(
              isIcon: true,
              r: 20,
              width: 25,
              height: 25,
              circleColor: lightGrey(),
              iconSize: 15,
              icon: icon,
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              txt,
              style: textThemeData.textTheme.overline,
            ),
          ],
        ),
      );
  _buildListOfDrawer(
    String title,
    IconData iconLead,
    IconData iconTrail,
  ) =>
      Padding(
        padding:  const EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  Icon(
                    iconLead,
                    size: 20.0,
                    color: deepGrey(),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    title,
                    style: textTheme.subtitle1,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  listDrawer.elementAt(8) == true
                      ? Container()
                      : Icon(
                          iconTrail,
                          size: 15.0,
                          color: deepGrey(),
                        ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Divider(),
          ],
        ),
      );
}
// ListTile(
// style: ListTileStyle.drawer,
// title:
// leading:
// trailing:
