import 'package:dio/dio.dart';

import '../../../utils/constants/api_constants.dart';
import '../../domain/services/http_service.dart';

class DioHttpServiceImp extends HttpService {
  late Dio _dio;

  DioHttpServiceImp() {
    //TODO: Usaria .env, mas pra facilitar vou deixar exposta
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.kBaseUrl,
        headers: {'content-type': 'application/json;charset=utf-8'},
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );
  }

  @override
  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters, Options? options}) {
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }

  //Como é apenas um get, nao implementei os outros métodos
}
