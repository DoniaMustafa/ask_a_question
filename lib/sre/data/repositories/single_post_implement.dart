import 'package:dio/dio.dart';
import 'package:discy_application/sre/core/usecases/usecase.dart';
import 'package:discy_application/sre/core/utils/end_point.dart';
import 'package:discy_application/sre/domain/repositories/single_question_repo.dart';

class SingleQuestionImpl implements SingleQuestionRepository {
  SingleQuestionImpl(this._dioServerRepos);

  final UseCase? _dioServerRepos;
  @override
  Future<Response> getSinglePost(
      {required int id, required String postType}) async {
    return await _dioServerRepos!
        .call(path: kSingleQuestion, query: {'id': id, 'post_type': postType});
  }

  @override
  Future<Response> getAnswerQuestion(
      {required int id, required String posType}) async {
    return await _dioServerRepos!
        .call(path: kAnswersQuestion, query: {'id': id, 'post_type': posType});
  }
}
