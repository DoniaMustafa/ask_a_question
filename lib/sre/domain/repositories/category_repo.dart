
import 'package:dio/dio.dart';

abstract class CategoryRepository{
  Future<Response>getCategories();
  Future<Response>getSingleCategory({required int id});
}