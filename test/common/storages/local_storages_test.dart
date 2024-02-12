
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:very_good_starter_app/common/storages/local_storages.dart';
import 'package:very_good_starter_app/common/utils/name_constant.dart';

// Buat mock SharedPreferences
class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late LocalStorageImpl localStorage;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    localStorage = LocalStorageImpl(mockSharedPreferences);
  });

    test('getAccessToken should return access token', () async {
    // Atur respons dari SharedPreferences
    when(() => mockSharedPreferences.getString(NameConstant.accessTokenKey))
        .thenReturn('test_token');

    // Panggil metode yang diuji
    final result = await localStorage.getAccessToken();

    // Periksa apakah hasilnya sesuai dengan yang diharapkan
    expect(result, 'test_token');
  });

  test('setAccessToken should store access token', () async {
    // Menetapkan respons untuk pemanggilan setString
    when(() => mockSharedPreferences.setString(any(), any()))
        .thenAnswer((_) async => true);

    // Panggil metode yang diuji
    await localStorage.setAccessToken('test_token');

    // Verifikasi bahwa SharedPreferences telah dipanggil dengan nilai yang benar
    verify(() => mockSharedPreferences.setString(
        NameConstant.accessTokenKey, 'test_token')).called(1);
  });
}
