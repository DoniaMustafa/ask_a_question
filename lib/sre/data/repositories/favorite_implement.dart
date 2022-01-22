import 'package:dio/src/response.dart';
import 'package:discy_application/sre/core/usecases/usecase.dart';
import 'package:discy_application/sre/core/utils/end_point.dart';
import 'package:discy_application/sre/domain/repositories/fav_repo.dart';

class FavoriteImplement implements FavoriteRepository{
  FavoriteImplement(this._dioServerRepos);

 final UseCase? _dioServerRepos;
  @override
  Future<Response> getFavFromArticle()async {
 return await _dioServerRepos!.call(path: kGetFav,query: {
   'page':1,
   'count':10
 });
  }

  @override
  Future<Response> addAndRemoveSingleArticleFavorite({required int id, required String action})async {
    return await _dioServerRepos!.call(path: kFav,query:{
      'id':id,
      'action':action
    });
  }

  @override
  Future<Response> removeSingleQuestionFromFavorite({required int id})async {

    return await _dioServerRepos!.call(path: kFav,query:{
      'id':id,
      'action':'remove'
    });

  }


  }