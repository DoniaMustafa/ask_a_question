import 'package:discy_application/sre/presentation/bloc/home_blocs/no_answer_cubit/no_answer__qus_cubit.dart';
import 'package:discy_application/sre/presentation/widgets/custom_list_of_rticle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoAnswersScreen extends StatelessWidget {
  const NoAnswersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoAnswerQusCubit, NoAnswerQusState>(
        builder: (context, state) {
          if (state is NoAnswerSuccessState &&
              state.articleModel != null){
            print( state.articleModel!.articleModel!.length);
            return Container(
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, i) {
                    print( state.articleModel!.articleModel![i].categories);
                    return  CustomListOfArticle( article: state.articleModel!.articleModel![i]);
                  },
                  separatorBuilder: (context, i) => Divider(),
                  itemCount: state.articleModel!.articleModel!.length),
            );}else{

            return Center(child: CircularProgressIndicator());
          }
        });
  }


}
