import 'dart:developer';

import 'package:dio/dio.dart';

class ConnectionInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log(
      'Request: ${options.method} ${options.path}',
      name: 'request interceptor',
    );
    log('Headers: ${options.headers}', name: 'request interceptor');
    log(
      'Query Parameters: ${options.queryParameters}',
      name: 'request interceptor',
    );
    log('Body: ${options.data}', name: 'request interceptor');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log(
      'Response: ${response.statusCode} ${response.statusMessage}',
      name: 'response interceptor',
    );
    log('Data: ${response.data}', name: 'response interceptor');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('Error: ${err.message}', name: 'error interceptor', error: err);
    log(
      'Response: ${err.response?.statusCode} ${err.response?.statusMessage}',
      name: 'error interceptor',
    );
    log('Data: ${err.response?.data}', name: 'error interceptor');
    super.onError(err, handler);
  }
}
