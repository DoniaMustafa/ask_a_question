import 'package:discy_application/sre/di.dart';
import 'package:discy_application/sre/domain/entities/article/article.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/bump_bloc/bump_que_cubit.dart';
import 'package:discy_application/sre/presentation/widgets/build_list_item_widget.dart';
import 'package:discy_application/sre/presentation/widgets/custom_list_of_rticle_widget.dart';
import 'package:discy_application/sre/presentation/widgets/default_text_button_widget.dart';
import 'package:discy_application/sre/presentation/widgets/listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BumpQuestionScreen extends StatelessWidget {
  const BumpQuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<BumpQueCubit, BumpQueState>(builder: (context, state) {
        if (state is BumpQueSuccessState &&
            state.articleResponseModel != null) {
          print(state.articleResponseModel.articleModel!.length);
          return Column(
            children: [
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    // print( state.articleResponseModel.articleModel![i].categories);
                    return  CustomListOfArticle(
                        article: state.articleResponseModel.articleModel![i],);
                  },
                  separatorBuilder: (context, i) => Divider(),
                  itemCount: state.articleResponseModel.articleModel!.length),
              if (di<BumpQueCubit>().currentPage <=
                  state.articleResponseModel.pages!)
                Container(
                  child:state is ! MoreBumpQueLoadingState? DefaultTextButtonWidget(
                    text: 'Load More...',
                    onPressed: () {
                      if (di<BumpQueCubit>().currentPage <=
                          state.articleResponseModel.pages!) {
                        print('currentPage : ${di<BumpQueCubit>().currentPage}');
                        print('pages : ${state.articleResponseModel.pages!}');

                        di<BumpQueCubit>().getMoreBumpQusFromArticle();
                      } else {
                        Container(child: Text('No more data'));
                      }
                    },
                  ):CircularProgressIndicator(),
                ),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }),
    );
  }




}
