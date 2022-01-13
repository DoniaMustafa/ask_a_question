import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:discy_application/sre/data/model/article/article_response_model.dart';
import 'package:discy_application/sre/data/model/different_article/article_response_model.dart';
import 'package:discy_application/sre/domain/repositories/article_repo.dart';
import 'package:meta/meta.dart';

part 'vote_ques_state.dart';

class MostVoteCubit extends Cubit<MostVoteState> {
  MostVoteCubit(this._repository) : super(MostVoteInitial());
  ArticleRepository _repository;

  ArticleResponseModel? _articleModel;
  Future<Response?> getMostVoteArticle() async {
    emit(MostVoteLoadingState());

    return await _repository.getMostVoteFromArticle().then((value) {
      _articleModel = articleResponseModel(value.toString());
      print(_articleModel);
      emit(MostVoteSuccessState(articleModel: _articleModel));
    }).catchError((error) {
      emit(MostVoteErrorState(error: error.toString()));
    });
  }
}
