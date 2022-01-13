import 'package:dio/dio.dart';

abstract class CurrentUserRepository{
  Future<Response>getCurrentUser();
}