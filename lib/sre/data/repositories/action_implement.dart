 import 'package:dio/src/response.dart';
import 'package:discy_application/sre/core/usecases/usecase.dart';
import 'package:discy_application/sre/core/utils/end_point.dart';
import 'package:discy_application/sre/domain/repositories/actions_repo.dart';

class ActionImplement implements ActionRepository{
  ActionImplement(this._dioServer);
 final UseCase _dioServer;
    @override
    Future<Response> postGetVoteOfArticle({required int id, required String type,required String action})async {
      return await _dioServer.callPost(path: kChangeVote,data:{
        'id':id,
        'type':type,
        'action':action
      });

    }

}