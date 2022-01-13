import 'package:dio/dio.dart';

abstract class SettingRepository{


  Future<Response>getFAQ();
  Future<Response>getNotify();

}