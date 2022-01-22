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

  Future<Response?> getFav() async {
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
      print('f true id : $id');
    } else {
      favorite[id]=false;
      fav = 'remove';
      print('f false id : $id');
      print('f false: $fav');

    }
    // addAndRemoveOfFavorite(id: id, action: fav);
    print('fav : $fav');
    print(favorite[id]);

    emit(FavChangeAction());
  }



  Future<Response?> addAndRemoveOfFavorite(
      {required int id}) async {
    select(id: id);
    print(FavLoadingAddAndRemoveFav);
    emit(FavLoadingAddAndRemoveFav());
    print('FavLoading id : $id');
    print('FavLoading action : $fav');

    return await favoriteRepository
        .addAndRemoveSingleArticleFavorite(id: id, action: fav)
        .then((value) {
      favModel =
          changeFavoriteModel(value.toString());
      print('value.data : ${value.data}');
      print('favModel : $favModel');

      if (favModel!.status == false) {
        select(id: id);
      }
      print('changeFavoriteModel action : $fav');


      getFav();
      print('f changeFavoriteModel id : $id');
      emit(FavLoadedAddAndRemoveFav(favModel));
    }).catchError((onError) {
      print('onError id : $id');
      print('onError action : $fav');
      if(favorite[id]!) {
        fav = 'remove';
        print('f false id : $id');
        print('f false: $fav');
      }
      select(id: id);
      print('onError : ${onError.toString()}');
      emit(FavErrorAddAndRemoveFav());
    });
  }

  removeSingleQuestionFromFavorite(int id){
    emit(FavLoadingRemoveFav());
    print('FavLoadingRemoveFav');

    return favoriteRepository.removeSingleQuestionFromFavorite(id: id).then((value) {
      favModel =
          changeFavoriteModel(value.toString());
      print('removeSingleQuestionFromFavorite');
      emit(FavLoadedRemoveFav(favModel));
    }).catchError((error){
      print('removeSingleQuestionFromFavorite${error.toString()}');

      emit(FavErrorRemoveFav());
    });
  }

}
