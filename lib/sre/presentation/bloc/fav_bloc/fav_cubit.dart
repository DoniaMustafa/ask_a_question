import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:discy_application/sre/core/utils/const.dart';
import 'package:discy_application/sre/data/model/article/article_response_model.dart';
import 'package:discy_application/sre/data/model/fav_model.dart';
import 'package:discy_application/sre/domain/repositories/fav_repo.dart';
import 'package:meta/meta.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit(this.favoriteRepository) : super(FavInitialState());
  FavoriteRepository favoriteRepository;
  ChangeFavoriteModel? favModel;
  ArticleResponseModel? article;
  String fav = '';

  getFav() async {
    emit(FavLoadingState());
    return await favoriteRepository.getFavFromArticle().then((value) {
      article = articleResponseModel(value.toString());
      print(article!.count);

      emit(FavLoadedState(article));
    }).catchError((onError) {
      print(onError.toString());
      emit(FavExceptionState());
    });
  }

  select({required int id}) {
    favorite[id] =! favorite[id]!;
    if (favorite[id]!) {
      favorite[id] =true;
      fav = 'add';
      print('f true: $fav');
    } else {
      favorite[id]=false;
      fav = 'remove';
      print('f false: $fav');

    }
    addAndRemoveOfFavorite(id: id, action: fav);
    print('fav : $fav');
    print(favorite[id]);

    emit(FavChangeAction());
  }

  Future<Response?> addAndRemoveOfFavorite(
      {required int id, required String action}) async {
    favorite[id] = !favorite[id]!;
    print(FavLoadingAddAndRemoveFav);
    emit(FavLoadingAddAndRemoveFav());

    return await favoriteRepository
        .addAndRemoveSingleArticleFavorite(id: id, action: action)
        .then((value) {
      favModel =
          changeFavoriteModel(value.data.toString());
      print('value.data : ${value.data}');
      if (favModel!.status == false) {
        favorite[id] = !favorite[id]!;
      }
      getFav();
      emit(FavLoadedAddAndRemoveFav(favModel));
    }).catchError((onError) {
      favorite[id] = !favorite[id]!;
      print(onError.toString());
      emit(FavErrorAddAndRemoveFav());
    });
  }
}
