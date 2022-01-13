
import 'package:dio/dio.dart';

abstract class ArticleRepository{
  Future<Response> getRecentQusFromArticle();
  Future<Response>getMoreQuestionData({required int pages});

  Future<Response> getAnswerFromArticle({required int page});
  Future<Response> getMoreAnswerFromArticle({required int page});

  Future<Response> getBumpQusFromArticle();
  Future<Response> getMoreBumpQusFromArticle({required int page});
  Future<Response> getMostAnswerFromArticle();

  Future<Response> getRecentPostFromArticle();
  Future<Response> getMostVoteFromArticle();
  Future<Response> getNoAnswerFromArticle();
}
