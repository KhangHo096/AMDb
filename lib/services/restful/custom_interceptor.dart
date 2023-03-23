import 'package:amdb/services/logger_service.dart';
import 'package:dio/dio.dart';

class CustomInterceptor extends Interceptor {
  static const genericErrorMessage =
      'Oops! Something went wrong! Please try again!';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    LoggerService.log
        .i('Requesting:\n${options.method} - ${options.uri.toString()}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    LoggerService.log.i('${response.statusCode} - ${response.requestOptions.uri.toString()}');
    LoggerService.log.i(response.data);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    LoggerService.log.i('onError:\n'
        'code = ${err.response?.statusCode} ${err.message}\n'
        'Request uri: ${err.requestOptions.uri}\n'
        'Message: ${err.message}');
    super.onError(err, handler);
  }
}
