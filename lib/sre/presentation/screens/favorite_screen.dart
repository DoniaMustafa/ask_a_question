import 'package:discy_application/sre/di.dart';
import 'package:discy_application/sre/domain/entities/article/article.dart';
import 'package:discy_application/sre/presentation/bloc/fav_bloc/fav_cubit.dart';
import 'package:discy_application/sre/presentation/widgets/custom_list_of_rticle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<FavCubit>()..getFav(),
      child: BlocBuilder<FavCubit, FavState>(
        builder: (context, state) {
          if (state is FavLoadedState && state.article != null ) {
            print(state.article!.articleModel!.length);
            return ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: (){

                    },
                    child: CustomListOfArticle(

                        article: state.article!.articleModel![i]),
                  );
                },
                separatorBuilder: (context, i) => Divider(
                      thickness: 2,
                    ),
                itemCount: state.article!.articleModel!.length);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

}
