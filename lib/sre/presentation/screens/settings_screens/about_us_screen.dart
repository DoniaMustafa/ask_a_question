import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:flutter/material.dart';

class AboutUScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Us',
          style: textThemeData.textTheme.headline6,
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 18.0,vertical: 20.0),
        child: Column(
          children: [
            Image(
                image: NetworkImage(
                    'https://2code.info/demo/themes/Discy/Main/wp-content/uploads/2018/04/team-7-768x510.jpg')),
         SizedBox(height: 30.0,),

            RichText(
              text: TextSpan(
                  text:
                      'Discy mission is to share and grow the world’s knowledge. A vast amount of the knowledge that would be valuable to many people is currently only available to a few — either locked in people’s heads, or only accessible to select groups. We want to connect the people who have knowledge to the people who need it, to bring together people with different perspectives so they can understand each other better, and to empower everyone to share their knowledge for the benefit of the rest of the world.\n '
                          'The potential of this is huge. If we can execute on our mission, we’re going to make a big impact on the world. We just need to get a smart group of people together that can get us there.',
                  style: textThemeData.textTheme.bodyText1),
            ),
          ],
        ),
      ),
    );
  }
}
