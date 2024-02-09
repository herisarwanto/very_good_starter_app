import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:injectable/injectable.dart';
import 'package:very_good_starter_app/common/network/interceptors/token_interceptor.dart';
import 'package:very_good_starter_app/common/network/interceptors/url_interceptor.dart';

@LazySingleton(as: Dio)
@Named('public_dio')
class DioModule with DioMixin implements Dio {
  final UrlInterceptor _urlInterceptor;
  final TokenInterceptor _tokenInterceptor;

  DioModule(
    UrlInterceptor urlInterceptor,
    TokenInterceptor tokenInterceptor,
    this._urlInterceptor,
    this._tokenInterceptor,
  ) {
    final newOptions = BaseOptions(
      contentType: 'application/json',
      headers: {
        'Accept': 'application/json',
      },
      connectTimeout: serverTimeoutDuration(),
      sendTimeout: serverTimeoutDuration(),
      receiveTimeout: serverTimeoutDuration(),
    );

    options = newOptions;
    interceptors.addAll([
      _urlInterceptor,
      _tokenInterceptor,
    ]);

    httpClientAdapter = IOHttpClientAdapter();
  }
}

Duration serverTimeoutDuration() => const Duration(seconds: 15);
