import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:discy_application/sre/data/model/answer_article/answer_article_respo_model.dart';
import 'package:discy_application/sre/data/model/answer_article/comment_answer_model.dart';
import 'package:discy_application/sre/data/model/article/article_response_model.dart';
import 'package:discy_application/sre/domain/repositories/article_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'answer_ques_state.dart';

class AnswerQuesCubit extends Cubit<AnswerQuesState> {
  AnswerQuesCubit(this._repository) : super(AnswerQuesInitial());

  ArticleRepository _repository;
  AnswerModel? answerModel;
List<CommentAnswerModel>articleComment=[];
  int c = 1;


  Future<Response?> getAnswerQuesArticle() async {
    emit(AnswerQuesLoadingStates());
    return await _repository.getAnswerFromArticle(page: c).then((value) {
      answerModel = answerModelFromJson(value.toString());
      articleComment.addAll(answerModel!.comments!);
      c++;
      print('ar : $articleComment');
      print('c : ${c++}');
      emit(AnswerQuesSuccessStates(answerModel: answerModel!,commentModel: articleComment));
    }).catchError((error) {
      print('AnswerQuesError : ${error.toString()}');
      emit(AnswerQuesErrorStates(error: error.toString()));
    });
  }

  Future<Response?> getMoreAnswerQuesArticle() async {
    return await _repository.getMoreAnswerFromArticle(page: c).then((value) {
      answerModel = answerModelFromJson(value.toString());

      articleComment.addAll(answerModel!.comments!);
      print('ar : $articleComment');
      print('c : ${c+1}');

      c+1;
      emit(AnswerQuesSuccessStates(answerModel: answerModel!,commentModel: articleComment));
    }).catchError((error) {
      print('AnswerError : ${error.toString()}');
      emit(AnswerQuesErrorStates(error: error.toString()));
    });
  }

}
