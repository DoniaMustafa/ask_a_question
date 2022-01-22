import 'package:bloc/bloc.dart';
import 'package:discy_application/sre/data/model/tag/respons_tag_model.dart';
import 'package:discy_application/sre/domain/repositories/tags_repo.dart';
import 'package:meta/meta.dart';

part 'tag_state.dart';

class TagCubit extends Cubit<TagState> {
  TagCubit(this._tagsRepository) : super(TagInitial());
  TagsRepository _tagsRepository;
  ResponseTagModel? _tagModel;
  getTags({required int id,required String taxonomy }){
    emit(TagLoadingState());
    _tagsRepository.getSingleTags(id: id, taxonomy: taxonomy).then((value) {
_tagModel=responseTagModel(value.toString());
      emit(TagSuccessState(_tagModel));
    }).catchError((exception){


      emit(TagErrorState());
    });}

}
