import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:discy_application/sre/data/model/notify/notify_model.dart';
import 'package:discy_application/sre/presentation/bloc/settings_bloc/notify_bloc/notify_cubit.dart';
import 'package:discy_application/sre/presentation/widgets/default_but_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di.dart';

class NotifyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification',style: textThemeData.textTheme.headline6,),
      ),
      body: Container(
        child: BlocProvider(
          create: (context) => di<NotifyCubit>()..getNotify(),
          child: BlocBuilder<NotifyCubit, NotifyState>(
            builder: (context, state) {
              if (state is NotifySuccessState && state.notify != null) {
                return ListView.separated(
                    itemBuilder: (context, i) => _buildNotify(notify: state.notify.notifications![i],),
                    // onPress: ()=>state.notify.notifications!.removeAt(i)),
                    separatorBuilder: (context, i) => Divider(),
                    itemCount: state.notify.notifications!.length);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  _buildNotify({required NotifyData notify,})=>Padding(
    padding:  EdgeInsets.all(10.0),
    child: ListTile(
      title: Text(
        notify.title,
      ),
      leading:Icon(IconData(int.parse(notify.icon.toString()),),size: 30,
      ) ,
      subtitle: Text(
        notify.date.toString(),
        style: textThemeData.textTheme.overline,
      ),
      trailing:DefaultButtonWidget(onPress:(){
        print('d');
        }, text: 'Dismiss',),
    ),
  );
}
