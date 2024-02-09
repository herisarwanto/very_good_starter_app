import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:very_good_starter_app/common/utils/name_constant.dart';

class GlobalHelper {
  /// Check status code from response API
  static bool isSuccessStatus(int? statusCode) {
    if (statusCode == null) return false;
    if (statusCode == 200 || statusCode == 201) {
      return true;
    }

    return false;
  }

  /// Handling error response DIO
  static ResponseModel errorResponseData(dynamic error) {
    var data = ResponseModel();

    try {
      if (error is DioException) {
        if (error.type == DioExceptionType.badResponse) {
          final response = error.response;
          if (response != null && response.data != null) {
            final responseData = jsonDecode(response.data as String) as Map;
            data = ResponseModel(
                message: responseData['message'] as String,
                statusCode: response.statusCode ?? -1);
          }
        } else if (error.type == DioExceptionType.connectionTimeout ||
            error.type == DioExceptionType.receiveTimeout ||
            error.type == DioExceptionType.sendTimeout) {
          data = ResponseModel(message: 'Request timeout', statusCode: 408);
        } else if (error.error is SocketException) {
          data.message = NameConstant.noInternetConnection;
        }
      } else if (error is SocketException) {
        data.message = NameConstant.noInternetConnection;
      }
    } catch (e) {
      data.message = e.toString();
    }

    return data;
  }

  /// Check contents of the object
  static bool dataIsNotEmpty(dynamic data) {
    if (data == null || data == '' || data == 'null') return false;
    return true;
  }

  /// Get initial name
  static String getInitials(String name) {
    final splitName = name.split(' ');
    var result = '';

    for (final data in splitName) {
      if (data.isNotEmpty) {
        result += data[0].toUpperCase();
      }
    }

    return result;
  }

  /// Check email format
  static bool isValidEmail(String email) {
    if (email.isEmpty) return false;
    return RegExp(r'^.+@.+\..+$').hasMatch(email);
  }
}

class ResponseModel {
  ResponseModel({
    this.statusCode = -1,
    this.message = 'Unknown Error',
  });

  int statusCode;
  String message;
}
