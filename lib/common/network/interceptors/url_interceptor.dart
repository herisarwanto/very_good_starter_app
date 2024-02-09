import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:very_good_starter_app/common/domain/failures/errors.dart';
import 'package:very_good_starter_app/common/utils/url_constant.dart';

@lazySingleton
class UrlInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final url = UrlConstant.baseUrl;

    // Handling, if using url from remote config
    if (url == null) {
      return handler.reject(
          DioException(requestOptions: options, error: NoBaseUrlError()));
    }
    final newOption = options.copyWith(baseUrl: url);
    return handler.next(newOption);
  }
}
