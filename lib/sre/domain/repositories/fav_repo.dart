import 'package:dio/dio.dart';

abstract class FavoriteRepository{


  Future<Response>getFavFromArticle();
  Future<Response>addAndRemoveSingleArticleFavorite({required int id,required String action});

}