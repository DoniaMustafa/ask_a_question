import 'package:discy_application/sre/di.dart';
import 'package:discy_application/sre/domain/entities/article/article.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/recent_bloc/recent_ques_cubit.dart';
import 'package:discy_application/sre/presentation/widgets/custom_list_of_rticle_widget.dart';
import 'package:discy_application/sre/presentation/widgets/listview_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RecentQuestionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentQuesCubit, RecentQuesState>(
        builder: (context, state) {
      if (state is RecentQuestionSuccessStates &&
          state.articleResponseModel != null) {
        print(state.articleResponseModel.articleModel!.length);
        return Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        child: CustomListOfArticle( article: state.article[i]),
                      );
                    },
                    separatorBuilder: (context, i) => Divider(
                          thickness: 2,
                        ),
                    itemCount: state.article.length),
                di<RecentQuesCubit>().currentPage <=
                        state.articleResponseModel.pages!
                    ? Stack(
                        children: [
                          MaterialButton(
                            child: Text(
                              'Show More... ',
                            ),
                            onPressed: () {
                              if (di<RecentQuesCubit>().currentPage <=
                                  state.articleResponseModel.pages!) {
                                print(
                                    'di :${state.articleResponseModel.pages!}');
                                print(
                                    'currentPage :${di<RecentQuesCubit>().currentPage}');
                                print(di<RecentQuesCubit>()..currentPage);
                                di<RecentQuesCubit>().getMoreQuestionData();
                              } else {
                                Fluttertoast.showToast(msg: 'no data');
                              }
                            },
                          ),
                          if (state is MoreRecentQuestionLoadingStates)
                            CircularProgressIndicator(),
                        ],
                      )
                    : Container(child: Text('No more Question'))
              ],
            ),
          ),
        );
      } else {
        return Center(child: CircularProgressIndicator());
      }
    });
  }

}
