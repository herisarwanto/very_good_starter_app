import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:very_good_starter_app/common/storages/local_storages.dart';

@lazySingleton
class TokenInterceptor extends Interceptor {
  TokenInterceptor(this._storage);
  final LocalStorage _storage;

  @override
  FutureOr<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    final token = await _storage.getAccessToken();
    if (token == null) {
      return handler.reject(DioException(requestOptions: options));
    }
    final newOption = options.copyWith(
      headers: {
        ...options.headers,
        'Authorization': 'Bearer $token',
      },
    );
    return handler.next(newOption);
  }
}