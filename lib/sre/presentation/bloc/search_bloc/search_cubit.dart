import 'package:bloc/bloc.dart';
import 'package:discy_application/sre/data/model/article/article_response_model.dart';
import 'package:discy_application/sre/domain/repositories/search_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchRepository) : super(SearchInitial());
  SearchRepository _searchRepository;
  TextEditingController controller = TextEditingController();
ArticleResponseModel? articleModel;
  getSearch({required String text})async{
    emit(SearchLoading());
    return await _searchRepository.getSearch(text: text).then((value){
      articleModel = articleResponseModel(value.toString());
      print(articleModel);
      emit(SearchSuccess(articleModel));

    }).catchError((error){
      emit(SearchError());

    });
  }
}
