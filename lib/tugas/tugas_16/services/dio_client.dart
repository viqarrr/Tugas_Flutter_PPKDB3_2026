import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/services/token_storage.dart';

Dio createDioClient() {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://appabsensi.mobileprojp.com',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Accept': 'application/json',
      },
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await TokenStorage.getToken();
        if (token != null && token.isNotEmpty) {
          final authHeader = token.startsWith('Bearer ') ? token : 'Bearer $token';
          options.headers['Authorization'] = authHeader;
        }
        log('[DioRequest] ${options.method} ${options.uri}');
        handler.next(options);
      },
      onError: (DioException e, handler) {
        log('[DioError] ${e.type}: ${e.message} (status: ${e.response?.statusCode})');
        handler.next(e);
      },
    ),
  );

  dio.interceptors.add(
    LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (obj) => log(obj.toString()),
    ),
  );

  return dio;
}
