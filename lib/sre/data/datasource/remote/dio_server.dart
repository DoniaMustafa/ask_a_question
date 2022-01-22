import 'package:dio/dio.dart';
import 'package:discy_application/sre/core/utils/end_point.dart';

class DioServer {
   Dio dio = Dio(
       BaseOptions(
      baseUrl: kBaseURL,
      receiveDataWhenStatusError: false,
         headers: {
        "Authorization":
        "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvMmNvZGUuaW5mb1wvZGVtb1wvdGhlbWVzXC9EaXNjeVwvQm94ZWQiLCJpYXQiOjE2NDE2ODA0ODEsIm5iZiI6MTY0MTY4MDQ4MSwiZXhwIjoxNjczMjE2NDgxLCJkYXRhIjp7InVzZXIiOnsiaWQiOjM0Mn19fQ.cceLWoOoS3PO2SjkKulPiaZjEkZ8jpJeF403lsBGej4"
         }
    ));

}
