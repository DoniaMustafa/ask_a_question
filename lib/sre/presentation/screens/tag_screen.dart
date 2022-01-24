import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:discy_application/sre/di.dart';
import 'package:discy_application/sre/presentation/bloc/tag_bloc/tag_cubit.dart';
import 'package:discy_application/sre/presentation/widgets/custom_list_of_rticle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TagScreen extends StatelessWidget {
  final int id;
  final String name;
  final String taxonomy;
  TagScreen({required this.id, required this.name,required this.taxonomy});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<TagCubit>()..getTags(id: id,taxonomy:taxonomy ),
      child: Scaffold(
        appBar: AppBar(
          title:  Text(
            '$name',
            style: textThemeData.textTheme.headline6,
          )
        ),
        body:  BlocBuilder<TagCubit, TagState>(
            builder: (context, state) {
              if (state is TagSuccessState &&
                  state.tagModel != null) {
                print(state.tagModel!.article!.length);
                return Container(
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, i) {
                        return CustomListOfArticle(
                          article: state.tagModel!.article![i],
                        );
                      },
                      separatorBuilder: (context, i) => Divider(),
                      itemCount: state.tagModel!.article!.length),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }

}

