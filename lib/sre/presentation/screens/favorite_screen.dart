import 'package:discy_application/sre/di.dart';
import 'package:discy_application/sre/domain/entities/article/article.dart';
import 'package:discy_application/sre/presentation/bloc/fav_bloc/fav_cubit.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/home_bloc/home_cubit.dart';
import 'package:discy_application/sre/presentation/widgets/build_list_item_widget.dart';
import 'package:discy_application/sre/presentation/widgets/listview_widget.dart';
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
            return Stack(
              children: [

                Container(
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          child: _buildList(
                              context: context,
                              article: state.article!.articleModel![i]),
                        );
                      },
                      separatorBuilder: (context, i) => Divider(
                            thickness: 2,
                          ),
                      itemCount: state.article!.articleModel!.length),
                ),
                if(state is FavLoadedAddAndRemoveFav )
                  LinearProgressIndicator(),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  _buildList({required Article article, required context}) {
    // print(categoryModel.id);
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        article.categories == null
            ? Container()
            : buildCategAndDate(
                context: context,
                article: article,
              ),
        SizedBox(
          height: 15,
        ),
        buildUserInfo(article),
        SizedBox(height: 20),
        // if (article.thumbnail != null) image(img: article),
        // if (article.thumbnail != null) SizedBox(height: 20),
        title(article: article),
        SizedBox(height: 20),
        content(articleModel: article),
        article.tags == null ? Container() : buildTags(article: article,context:context),
        Divider(),
        article.customFields == null ? Container() : buildButtonsAction(article,context)
      ]),
    );
  }
}
