import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:discy_application/sre/data/model/article/article_response_model.dart';
import 'package:discy_application/sre/domain/entities/article/article.dart';
import 'package:discy_application/sre/domain/repositories/article_repo.dart';
import 'package:meta/meta.dart';

part 'bump_que_state.dart';

class BumpQueCubit extends Cubit<BumpQueState> {
  BumpQueCubit(this._repository) : super(BumpQueInitial());

  ArticleRepository _repository;
  ArticleResponseModel? articleModel;
  int currentPage=2;
  List<Article>article=[];
  Future<Response?> getBumpQueArticle() async {
    emit(BumpQueLoadingState());
    return await _repository.getBumpQusFromArticle().then((value) {
      print('state : ${value.data}');
      print('runtimeType : ${value.runtimeType}');
      articleModel = articleResponseModel(value.toString());
      print('_articleResponseModel : $articleModel');
      article=articleModel!.articleModel!;
      emit(BumpQueSuccessState(articleResponseModel: articleModel!,article: article));
    }).catchError((error) {
      print('BumpQueError : ${error.toString()}');
      emit(BumpQueErrorState(error: error.toString()));
    });
  }

  getMoreBumpQusFromArticle()async{
    emit(MoreBumpQueLoadingState());

    return await _repository.getMoreBumpQusFromArticle(page: currentPage).then((value) {
      articleModel = articleResponseModel(value.toString());

      article.addAll(articleModel!.articleModel!);
      currentPage ++;
      print('article : $article');
      print('currentPage +1 : ${currentPage ++}');

      emit(BumpQueSuccessState(articleResponseModel: articleModel!,article: article));

    }).catchError((error){
      print('Bump Error : ${error.toString()}');

      emit(BumpQueErrorState(error: error.toString()));

    });
  }
}
