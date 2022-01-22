import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:discy_application/sre/data/model/answer_article/answer_question_model.dart';
import 'package:discy_application/sre/data/model/single_post/response_single_post_model.dart';
import 'package:discy_application/sre/data/model/single_post/single_post_model.dart';
import 'package:discy_application/sre/domain/repositories/single_question_repo.dart';
import 'package:meta/meta.dart';
part 'singel_post_state.dart';

class SinglePostCubit extends Cubit<SinglePostState> {
  SinglePostCubit(this._repository) : super(SinglePostInitial());

  SingleQuestionRepository _repository;
  ResponseSingleQuestionModel? singleQues;

  Future<Response?> getSingleQues(
      {required int id, required String postType}) async {
    emit(SinglePostLoadingState());
    return await _repository
        .getSinglePost(id: id, postType: postType)
        .then((value) {
      singleQues = singleQuestionModelFromJson(value.toString());
      print('singleQues : $singleQues');
      print('singleQues : ${value.data}');

      emit(SinglePostSuccessState(singleQuestionModel: singleQues!.post!));
    }).catchError((error) {
      print(error.toString());
      emit(SinglePostErrorState(error: error.toString()));
    });
  }

  AnswerQuestionModel? answerModel;

  Future<Response?> getAnswerQuestion(
      {required int id, required String posType}) async {
    emit(SinglePostAnswerLoadingState());
    print("state");
    return await _repository
        .getAnswerQuestion(id: id, posType: posType)
        .then((value) {
      answerModel = answerQuestionModelFromJson(value.toString());
      emit(SinglePostAnswerSuccessState(answerModel: answerModel!));
      print('answerModel : $answerModel');
      print('answerModel : ${value.data}');

    }).catchError((error) {
      print(error.toString());
      emit(SinglePostAnswerErrorState(error: error.toString()));
    });
  }
}
