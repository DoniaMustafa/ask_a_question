import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:discy_application/sre/data/model/article/article_response_model.dart';
import 'package:discy_application/sre/domain/repositories/article_repo.dart';
import 'package:meta/meta.dart';

part 'no_answer__qus_state.dart';

class NoAnswerQusCubit extends Cubit<NoAnswerQusState> {
  NoAnswerQusCubit(this._repository) : super(NoAnswerQusInitial());
  ArticleRepository _repository;

 ArticleResponseModel? _articleModel;
  Future<Response?> getNoAnswerArticle() async {
    emit(NoAnswerLoadingState());

    return await _repository.getNoAnswerFromArticle().then((value) {
      _articleModel = articleResponseModel(value.toString());
      print(_articleModel);
      emit(NoAnswerSuccessState(articleModel: _articleModel));
    }).catchError((error) {
      emit(NoAnswerErrorState(error: error.toString()));
    });
  }


}
