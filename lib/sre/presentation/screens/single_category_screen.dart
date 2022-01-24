import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:discy_application/sre/di.dart';
import 'package:discy_application/sre/presentation/bloc/single_category_bloc/single_category_cubit.dart';
import 'package:discy_application/sre/presentation/widgets/custom_list_of_rticle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleCategoryScreen extends StatelessWidget {
  final int id;
  final String name;
  SingleCategoryScreen({required this.id, required this.name});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<SingleCategoryCubit>()..getSingleCategory(id: id),
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<SingleCategoryCubit, SingleCategoryState>(
            builder: (context, state) {
              return Text(
                '$name',
                style: textThemeData.textTheme.headline6,
              );
            },
          ),
        ),
        body:
        BlocBuilder<SingleCategoryCubit, SingleCategoryState>(
            builder: (context, state) {
          if (state is SingleCategorySuccessState &&
              state.articleResponseModel != null) {
            print(state.articleResponseModel!.length);
            return Container(
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, i) {
                    return CustomListOfArticle(
                        article: state.articleResponseModel![i],
                       );
                  },
                  separatorBuilder: (context, i) => Divider(),
                  itemCount: state.articleResponseModel!.length),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }

}
