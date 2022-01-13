import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:discy_application/sre/data/model/article/article_response_model.dart';
import 'package:discy_application/sre/domain/repositories/article_repo.dart';
import 'package:discy_application/sre/presentation/bloc/home_blocs/most_bloc/most_answer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MostAnswerCubit extends Cubit<MostAnswerState> {
  MostAnswerCubit(this._repository) : super(MostAnswerInitial());

  ArticleRepository _repository;
  ArticleResponseModel? articleModel;

  Future getMostAnsw()async {
    emit(MostAnswerLoadingStates());
    return await _repository.getMostAnswerFromArticle().then((value){
      articleModel=articleResponseModel(value.toString());
      print('articleModel : $articleModel');
      emit(MostAnswerSuccessStates(articleResponseModel: articleModel!));
    }).catchError((error){
      print('error : ${error.toString()}');
      emit(MostAnswerErrorStates(error:error.toString()));
    });

  }
}
