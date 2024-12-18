import 'package:dio/dio.dart';

class DioExceptionHandler {
  static String handleDioError(DioException error) {
    if (error.type == DioExceptionType.connectionError) {
      return "Verifique a sua conexão com a internet";
    }

    if (error.type == DioExceptionType.receiveTimeout) {
      return "Tempo de espera excedido";
    }

    if (error.type == DioExceptionType.sendTimeout) {
      return "Tempo de espera excedido";
    }

    return "Estamos passando por problemas técnicos, por favor, tente novamente"
        " mais tarde, se o problema persistir, entre em contato com o suporte";
  }
}
