import 'package:discy_application/sre/config/color/def_color.dart';
import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:discy_application/sre/di.dart';
import 'package:discy_application/sre/presentation/bloc/search_bloc/search_cubit.dart';
import 'package:discy_application/sre/presentation/widgets/custom_list_of_rticle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: textThemeData.textTheme.headline5,
        ),
      ),
      body: BlocProvider(
        create: (context) => di<SearchCubit>(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSearchContainer(),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchSuccess && state.articleModel != null) {
                    return _buildListOfSearch();
                  } else {
                    return Container();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildSearchContainer() => Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            return TextFormField(
              controller: di<SearchCubit>().controller,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () => di<SearchCubit>().getSearch(
                      text: di<SearchCubit>().controller.text,
                    ),
                    icon: Icon(Icons.search),
                  ),
                  filled: true,
                  fillColor: lightGrey(),
                  hintText: 'Type to search',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none)),
            );
          },
        ),
      );

  _buildListOfSearch() => BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchSuccess && state.articleModel != null) {
            return ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, i) {
                  return CustomListOfArticle(

                      article: state.articleModel!.articleModel![i]);
                },
                separatorBuilder: (context, i) => Divider(
                      thickness: 2,
                    ),
                itemCount: state.articleModel!.articleModel!.length);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      );
}
