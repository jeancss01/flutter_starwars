import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:starwars/utils/network_interceptor.dart';
import 'package:starwars/core/data/remote/models/base_error.dart';

typedef Future<T> Executor<T>(Dio context);

abstract class ApiProvider {
  final String _apiBaseUrl = "https://swapi.co";
  final String _apiPath = '/api';

  Dio _dio;

  ApiProvider() {
    BaseOptions options = BaseOptions(
        receiveTimeout: 15000,
        connectTimeout: 15000,
        contentType: 'application/json',
        baseUrl: '$_apiBaseUrl$_apiPath',
        responseType: ResponseType.json,
        followRedirects: false);
    _dio = Dio(options);
    //_dio.interceptors.add(NetworkInterceptor());
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
  }
  Future<T> executeAsync<T>(Executor<T> executor) async {
    return await executor(_dio);
  }

  BaseError handleError(DioError error) {
    BaseError baseError;
    try {
      if (error is DioError) {
        switch (error.type) {
          case DioErrorType.CANCEL:
            baseError = BaseError("", "Requisição cancelada", "cancel error");
            break;
          case DioErrorType.CONNECT_TIMEOUT:
            baseError = BaseError("", "Timeout de requisição", "timeout error");
            break;
          case DioErrorType.DEFAULT:
            baseError = BaseError("", "Erro desconhecido", "unknown error");
            break;
          case DioErrorType.RECEIVE_TIMEOUT:
            baseError = BaseError("", "Timeout de requisição", "timeout error");
            break;
          case DioErrorType.RESPONSE:
            baseError = BaseError.fromJson(error.response.data["error"]);
            break;
          case DioErrorType.SEND_TIMEOUT:
            baseError = BaseError("", "Timeout de requisição", "timeout error");
            break;
        }
      } else {
        baseError = BaseError("", "Erro desconhecido", "unknown error");
      }
    } catch (exc, stackTrace) {
      print("Exception occured: $error stackTrace: $stackTrace");
      return BaseError.unexpected();
    }
    return baseError;
  }
}
