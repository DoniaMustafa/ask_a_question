import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:discy_application/sre/data/model/different_article/article_response_model.dart';
import 'package:discy_application/sre/domain/repositories/article_repo.dart';
import 'package:meta/meta.dart';

part 'recent_post_ques_state.dart';

class RecentPostQuesCubit extends Cubit<RecentPostQuesState> {
  RecentPostQuesCubit(this._repository) : super(RecentPostQuesInitial());
  ArticleRepository _repository;



  DifferentArticleResponseModel? _articleModel;
  Future<Response?> getRecentPostArticle() async {
    emit(RecentPostLoadingState());
    return await _repository.getRecentPostFromArticle().then((value) {
      _articleModel = differentArticleResponseModel(value.toString());
      print(_articleModel);
      print(value.data);

      emit(RecentPostSuccessState(articleModel: _articleModel));
    }).catchError((error) {
      emit(RecentPostErrorState(error: error.toString()));
    });
  }

}
