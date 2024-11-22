import 'package:dio/dio.dart';

class ApiService{
  final Dio dio;
  final baseUrl="https://www.googleapis.com/books/v1/";

  ApiService(this.dio);

  Future<Map<String,dynamic>> get({required String endPoint}) async {

    var responce = await dio.get("$baseUrl$endPoint");
    return responce.data;
  }

}