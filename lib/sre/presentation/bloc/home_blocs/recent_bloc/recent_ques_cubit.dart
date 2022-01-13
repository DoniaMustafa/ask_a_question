import 'package:bloc/bloc.dart';
import 'package:discy_application/sre/core/utils/const.dart';
import 'package:discy_application/sre/data/model/article/article_response_model.dart';
import 'package:discy_application/sre/domain/entities/article/article.dart';
import 'package:discy_application/sre/domain/repositories/article_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'recent_ques_state.dart';

class RecentQuesCubit extends Cubit<RecentQuesState> {
  RecentQuesCubit(this._repository) : super(RecentQuesInitial());

  ArticleRepository _repository;
  ArticleResponseModel? articleModel;

  int currentPage = 2;
  List<Article> article = [];

  getDataFromArticle() async {
    emit(RecentQuestionLoadingStates());
    return await _repository.getRecentQusFromArticle().then((value) {
      articleModel = articleResponseModel(value.toString());
      article=articleModel!.articleModel!;
      // print(article.length);
      // print('currentPage ++:${currentPage++}');
      articleModel!.articleModel!.forEach((element) {
        favorite.addAll({element.id!: element.favorite!});
      });
      emit(RecentQuestionSuccessStates(articleResponseModel: articleModel!,article: article));
    }).catchError((error) {
      print('error recent: ${error.toString()}');

      emit(RecentQuestionErrorStates(error: error.toString()));
    });
  }

  getMoreQuestionData() async {
    emit(MoreRecentQuestionLoadingStates());
    return await _repository
        .getMoreQuestionData(pages: currentPage)
        .then((value) {
      articleModel = articleResponseModel(value.toString());
      article.addAll(articleModel!.articleModel!);
      currentPage++;

      print(article);
      print('currentPage+ : ${currentPage ++}');
      emit(RecentQuestionSuccessStates(articleResponseModel: articleModel!,article: article));

}).catchError((error) {
      print(error.toString());
      emit(RecentQuestionErrorStates(error: error.toString()));
    });
  }
}
