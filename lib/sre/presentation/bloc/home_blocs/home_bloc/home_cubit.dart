import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:discy_application/sre/data/model/vote_model.dart';
import 'package:discy_application/sre/domain/repositories/actions_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._articleRepository) : super(HomeInitial());
  ActionRepository _articleRepository;
  VoteModel? vote;
  Future<Response?> postVoteAction(
      {required int id, required String type, required String count}) async {
    emit(HomeLoading());
    return await _articleRepository
        .postGetVoteOfArticle(id: id, type: type, action: count)
        .then((value) {
      vote = VoteModel.fromJson(json.decode(value.data.toString()));
      emit(HomeLoaded(vote!));
    }).catchError((error) {

      emit(HomeError());
    });
  }
 bool select=false;
  String count= '';
}
