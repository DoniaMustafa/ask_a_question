import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:discy_application/sre/config/routes/route.dart';
import 'package:discy_application/sre/presentation/bloc/settings_bloc/notify_bloc/notify_cubit.dart';
import 'package:discy_application/sre/presentation/screens/settings_screens/FAQ_screen.dart';
import 'package:discy_application/sre/presentation/screens/settings_screens/about_us_screen.dart';
import 'package:discy_application/sre/presentation/screens/settings_screens/notify_screen.dart';
import 'package:discy_application/sre/presentation/widgets/listview_widget.dart';
import 'package:discy_application/sre/presentation/widgets/setting_widgets/item_widget.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    userPhoto(author: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjYmlp9JDeNMaFZzw9S3G1dVztGqF_2vq9nA&usqp=CAU[P9'),
                    CircleAvatar(
                      child: Icon(
                        Icons.done,
                        size: 15,
                        color: Colors.white,
                      ),
                      radius: 10,
                      backgroundColor: Colors.blue,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  alignment: Alignment.center, child: Text('Ahmed Hassan')),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    radius: 20,
                    child: Icon(
                      Icons.people_alt_rounded,
                      size: 15,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 7.5,
                  ),
                  Text(
                    '5',
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      radius: 20,
                      child: Icon(Icons.article, size: 15, color: Colors.grey)),
                  SizedBox(
                    width: 7.5,
                  ),
                  Text(
                    '56',
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      radius: 20,
                      child:
                          Icon(Icons.add_alert, size: 15, color: Colors.grey)),
                  SizedBox(
                    width: 7.5,
                  ),
                  Text('10'),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Divider(
                thickness: 1,
              ),
              InkWell(
                child: defaultItem(
                    txt: 'Edit Profile',
                    color: Colors.grey,
                    icon: Icons.arrow_forward_ios_rounded),
              ),
              Divider(
                thickness: 1,
              ),
              InkWell(
                onTap: ()=>navigatorTo(context: context, widget:AboutUScreen()),
                child: defaultItem(
                  txt: 'About Us',
                  color: Colors.grey,
                  icon: Icons.arrow_forward_ios_rounded,
                ),
              ),
              Divider(
                thickness: 1,
              ),
              InkWell(
                onTap: ()=>navigatorTo(context: context, widget:NotifyScreen()),
                child: defaultItem(
                  txt: ' Notification',
                  color: Colors.grey,
                  icon: Icons.arrow_forward_ios_rounded,
                ),
              ),
              Divider(
                thickness: 1,
              ),
              InkWell(
                  child: Container(
                      alignment: Alignment.bottomCenter,
                      child: defaultItem(
                        txt: 'Rate this app',

                        // size1: index.selected1
                      ))),
              Divider(
                thickness: 1,
              ),
              InkWell(
                  child: Container(
                      child: defaultItem(
                txt: 'Share this app',
                // size1: index.selected1
              ))),
              Divider(
                thickness: 1,
              ),
              InkWell(
                child: defaultItem(
                  txt: 'Privacy policy',
                  color: Colors.grey,
                  icon: Icons.arrow_forward_ios_rounded,
                ),
              ),
              Divider(
                thickness: 1,
              ),
              InkWell(
                onTap: ()=>navigatorTo(context: context, widget: FAQScreen()),
                child: defaultItem(
                  txt: 'Faq',
                  color: Colors.grey,
                  icon: Icons.arrow_forward_ios_rounded,
                ),
              ),
              Divider(
                thickness: 1,
              ),
              InkWell(
                child: defaultItem(
                  txt: 'Terms and Conditions',
                  color: Colors.grey,
                  icon: Icons.arrow_forward_ios_rounded,
                ),
              ),
              SizedBox(
                height: 7.5,
              ),
              Divider(
                thickness: 3,
                color: Colors.grey[200],
              ),
              SizedBox(
                height: 7.5,
              ),
              InkWell(
                child: defaultItem(
                  txt: 'Content Us',
                  color: Colors.grey,
                  icon: Icons.arrow_forward_ios_rounded,
                ),
              ),
              Divider(
                thickness: 1,
              ),
              defaultItem(
                txt: 'Login',
                icon: Icons.logout,
              )
            ],
          ),
        ),
      ),
    );
  }
}
