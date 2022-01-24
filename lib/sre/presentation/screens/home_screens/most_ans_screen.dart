import 'package:discy_application/sre/domain/entities/article/article.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/most_bloc/most_answer_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/most_bloc/most_answer_state.dart';
import 'package:discy_application/sre/presentation/widgets/custom_list_of_rticle_widget.dart';
import 'package:discy_application/sre/presentation/widgets/listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MostAnsweredScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MostAnswerCubit, MostAnswerState>(
        builder: (context, state) {
      if (state is MostAnswerSuccessStates &&
          state.articleResponseModel != null) {
        print(state.articleResponseModel.articleModel!.length);
        return Container(
          child: ListView.separated(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, i) {
                return  CustomListOfArticle(
                    article: state.articleResponseModel.articleModel![i]);
              },
              separatorBuilder: (context, i) => Divider(),
              itemCount: state.articleResponseModel.articleModel!.length),
        );
      } else {
        return Center(child: CircularProgressIndicator());
      }
    });
  }

}
