import 'package:dio/dio.dart';
import 'package:discy_application/sre/core/usecases/usecase.dart';
import 'package:discy_application/sre/core/utils/end_point.dart';
import 'package:discy_application/sre/domain/repositories/article_repo.dart';

class ArticlesRepositoryImplementation implements ArticleRepository {
  final UseCase? _dioServer;
  ArticlesRepositoryImplementation(this._dioServer);

  @override
  Future<Response> getRecentQusFromArticle() async{
    return await _dioServer!.call(path: kTabsCon,query: {
      'get_tab':kRecantQu,
      'count':10,
    });

  }

  @override
  Future<Response> getMoreQuestionData({required int pages})async {
    return await _dioServer!.call(path: kTabsCon,query: {
      'get_tab':kRecantQu,
      'count':10,
      'page': pages
    });
  }

  @override
  Future<Response> getMostAnswerFromArticle() async{
    return await _dioServer!.call(path: kTabsCon,query: {
      'get_tab':kMostAnsw,
      'count':8
    });
  }


  @override
  Future<Response> getBumpQusFromArticle() async{
    return await _dioServer!.call(path: kTabsCon,query: {
      'get_tab':kBump,
      'count':10
    });
  }

  @override
  Future<Response> getMoreBumpQusFromArticle({required int page}) async{
    return await _dioServer!.call(path: kTabsCon,query: {
      'get_tab':kBump,
      'count':10,
      'page':page

    });

  }

  @override
  Future<Response> getMostVoteFromArticle() async{
    return await _dioServer!.call(path: kTabsCon,query: {
      'get_tab':kMostVote,
      'count':8
    });  }



  @override
  Future<Response> getRecentPostFromArticle() async{
    return await _dioServer!.call(path: kTabsCon,query: {
      'get_tab':kRecantPost,
      'type':'post',
      'count':8
    });
  }


  @override
  Future<Response> getNoAnswerFromArticle()async {
    return await _dioServer!.call(path: kTabsCon,query: {
      'get_tab':kNoAnswer,
      'count':10,
      'page':1
    });
  }
  @override
  Future<Response> getAnswerFromArticle({required int page}) async{
    return await _dioServer!.call(path: kTabsCon,query: {
      'get_tab':kAnswer,
      'count':10,
      'page':page

    });
  }
  @override
  Future<Response> getMoreAnswerFromArticle({required int page}) async{
    return await _dioServer!.call(path: kTabsCon,query: {
      'get_tab':kAnswer,
      'count':10,
      'page':page
    });








}


}