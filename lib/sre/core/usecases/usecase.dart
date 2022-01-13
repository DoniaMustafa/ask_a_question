import 'package:discy_application/sre/core/parameters/api_request..dart';
import 'package:discy_application/sre/core/resources/data_state.dart';
import 'package:discy_application/sre/domain/entities/article/article.dart';

abstract class UseCase<T,P>{
  Future <T>call(P data);
  Future <T>callable(P data);

}

class DataUseCases extends UseCase{
  @override
  Future<DioState<List<Article>>> call(data) async{
  return await data;
  }

  @override
  Future<DioState<dynamic>> callable(data)async {
    return await data;
  }

}