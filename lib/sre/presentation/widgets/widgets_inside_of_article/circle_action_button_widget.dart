import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:discy_application/sre/di.dart';
import 'package:discy_application/sre/domain/entities/article/article.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/home_bloc/home_cubit.dart';
import 'package:discy_application/sre/presentation/widgets/listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CircleActionButtonWidget extends StatelessWidget {
  const CircleActionButtonWidget({Key? key,required this.customFields}) : super(key: key);
 final Article customFields;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<HomeCubit>(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Row(
            children: [
              buttonAction(
                  onPress: () => di<HomeCubit>().postVoteAction(
                      type: customFields.type!,
                      id: customFields.id!,
                      count: 'up')),
              customFields.customFields == null
                  ? Container()
                  : Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  text: TextSpan(
                      text: customFields.customFields!.questionVote![0]
                          .toString(),
                      style: textTheme.caption),
                ),
              ),
              buttonAction(
                  onPress: () => di<HomeCubit>().postVoteAction(
                      type: customFields.type!,
                      id: customFields.id!,
                      count: 'down'))
            ],
          );
        },
      ),
    );
  }
}
