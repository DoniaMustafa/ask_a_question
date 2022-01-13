import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:discy_application/sre/data/model/faq/faq_model.dart';
import 'package:discy_application/sre/domain/repositories/settings_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'faq_state.dart';

class FaqCubit extends Cubit<FaqState> {
  FaqCubit(this._repository) : super(FaqInitial());

  SettingRepository _repository;
 late FaqModel faqModel;
  Future<Response?>getFAQ()async{
    emit(FaqLoadingState());
    return await _repository.getFAQ().then((value) {
      faqModel = faqModelFromJson(value.toString());
      emit(FaqSuccessState(faqModel: faqModel));
    }).catchError((exception){
      emit(FaqErrorState(exception:exception));
    });
  }
  buildBottomSheet(context,widget )=>showModalBottomSheet(context: context, builder:(context)=>widget,);

}
