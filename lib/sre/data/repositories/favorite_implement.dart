import 'package:dio/src/response.dart';
import 'package:discy_application/sre/core/utils/end_point.dart';
import 'package:discy_application/sre/domain/repositories/dio_server_repo.dart';
import 'package:discy_application/sre/domain/repositories/fav_repo.dart';

class FavoriteImplement implements FavoriteRepository{
  FavoriteImplement(this._dioServerRepos);

 final DioServerRepos? _dioServerRepos;
  @override
  Future<Response> getFavFromArticle()async {
 return await _dioServerRepos!.call(path: kGetFav,query: {
   'page':1
 });
  }

  @override
  Future<Response> addAndRemoveSingleArticleFavorite({required int id, required String action})async {
    return await _dioServerRepos!.call(path: kFav,query:{
      'id':id,
      'action':action
    });
  }


  }