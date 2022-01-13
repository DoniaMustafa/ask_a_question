import 'package:dio/dio.dart';

abstract class DioState<T> {
  final T? data;
  final DioError? error;

  DioState({this.data, this.error});
}

class DataSuccess extends DioState {
  DataSuccess(data) : super(data: data);
}

class DataError extends DioState {
  DataError(error) : super(error: error);
}

