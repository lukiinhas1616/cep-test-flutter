import 'package:dio/dio.dart';

abstract class HttpService {
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

//Como é apenas um get, nao implementei os outros métodos
}
