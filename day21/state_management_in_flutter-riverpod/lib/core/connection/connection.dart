import 'package:day_21_state_management/core/connection/interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connection.g.dart';

const String _baseUrl = 'https://open-api.my.id/api/wilayah';

@riverpod
Dio dio(Ref ref) {
  final dio = Dio(BaseOptions(baseUrl: _baseUrl));
  dio.interceptors.add(ConnectionInterceptor());
  return dio;
}
