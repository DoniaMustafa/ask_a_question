import 'package:dio/src/response.dart';
import 'package:discy_application/sre/core/usecases/usecase.dart';
import 'package:discy_application/sre/core/utils/end_point.dart';
import 'package:discy_application/sre/domain/repositories/tags_repo.dart';

class SingleTagsImplementation implements TagsRepository{
 final UseCase _dioServerRepos;
  SingleTagsImplementation(this._dioServerRepos);

  @override
  Future<Response> getSingleTags({required int id,required String taxonomy}) async{
  return await _dioServerRepos.call(path: kSingleTag,query: {
    'id':id,
    'taxonomy':taxonomy
  });
  }


}