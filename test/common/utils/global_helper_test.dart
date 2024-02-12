import 'dart:io';

import 'package:dio/dio.dart';
import 'package:test/test.dart';
import 'package:very_good_starter_app/common/utils/global_helper.dart';
import 'package:very_good_starter_app/common/utils/name_constant.dart';

void main() {
  group('GlobalHelper', () {
    test('isSuccessStatus should return true for 200 status code', () {
      expect(GlobalHelper.isSuccessStatus(200), true);
    });

    test('isSuccessStatus should return true for 201 status code', () {
      expect(GlobalHelper.isSuccessStatus(201), true);
    });

    test('isSuccessStatus should return false for other status codes', () {
      expect(GlobalHelper.isSuccessStatus(404), false);
      expect(GlobalHelper.isSuccessStatus(500), false);
    });

    test('errorResponseData should return ResponseModel for DioException', () {
      final error = DioException(
        requestOptions: RequestOptions(path: 'test'),
        error: SocketException('No internet'),
        type: DioExceptionType.unknown,
      );

      final response = GlobalHelper.errorResponseData(error);

      expect(response.statusCode, -1);
      expect(response.message, NameConstant.noInternetConnection);
    });

    test('errorResponseData should return ResponseModel for SocketException', () {
      final error = SocketException('No internet');

      final response = GlobalHelper.errorResponseData(error);

      expect(response.statusCode, -1);
      expect(response.message, NameConstant.noInternetConnection);
    });

    test('dataIsNotEmpty should return true for non-empty data', () {
      expect(GlobalHelper.dataIsNotEmpty('Hello'), true);
    });

    test('dataIsNotEmpty should return false for empty data', () {
      expect(GlobalHelper.dataIsNotEmpty(''), false);
    });

    test('getInitials should return initials from name', () {
      expect(GlobalHelper.getInitials('John Doe'), 'JD');
    });

    test('isValidEmail should return true for valid email', () {
      expect(GlobalHelper.isValidEmail('test@example.com'), true);
    });

    test('isValidEmail should return false for invalid email', () {
      expect(GlobalHelper.isValidEmail('invalid.email'), false);
    });

    test('formatDate should return formatted date', () {
      final date = DateTime(2024, 2, 1);
      expect(GlobalHelper.formatDate(date), '2024-02-01');
    });
  });
}
