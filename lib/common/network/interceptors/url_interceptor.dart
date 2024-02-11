import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:very_good_starter_app/common/utils/url_constant.dart';

@lazySingleton
class BaseUrlInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.baseUrl = UrlConstant.baseUrl;
    super.onRequest(options, handler);
  }
}

