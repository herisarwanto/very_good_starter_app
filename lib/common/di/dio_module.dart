import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:injectable/injectable.dart';
import 'package:very_good_starter_app/common/network/interceptors/url_interceptor.dart';
import 'package:very_good_starter_app/common/utils/name_constant.dart';

@LazySingleton(as: Dio)
@Named(NameConstant.publicDio)
class DioModule with DioMixin implements Dio {
  final BaseUrlInterceptor _baseUrlInterceptor;

  DioModule(
    this._baseUrlInterceptor,
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
      _baseUrlInterceptor,
    ]);
    httpClientAdapter = IOHttpClientAdapter();
  }
}

Duration serverTimeoutDuration() => const Duration(seconds: 15);
