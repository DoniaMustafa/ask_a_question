import 'package:discy_application/sre/presentation/bloc/home_blocs/vote_cubit/vote_ques_cubit.dart';
import 'package:discy_application/sre/presentation/widgets/custom_list_of_rticle_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class MostVotedScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MostVoteCubit, MostVoteState>(
        builder: (context, state) {
          if (state is MostVoteSuccessState &&
              state.articleModel != null){
            print( state.articleModel!.articleModel!.length);
            return Container(
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, i) {
                    print( state.articleModel!.articleModel![i].categories);
                    return  CustomListOfArticle( article:state.articleModel!.articleModel![i]);
                  },
                  separatorBuilder: (context, i) => Divider(),
                  itemCount: state.articleModel!.articleModel!.length),
            );}else{

            return Center(child: CircularProgressIndicator());
          }
        });
  }



}

