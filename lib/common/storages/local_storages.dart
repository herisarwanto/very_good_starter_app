import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:very_good_starter_app/common/utils/name_constant.dart';

abstract class LocalStorage {
  Future<String?> getAccessToken();

  void setAccessToken(String accessToken);
}

@LazySingleton(as: LocalStorage)
class LocalStorageImpl implements LocalStorage {
  const LocalStorageImpl(this._storage);

  final SharedPreferences _storage;

  @override
  Future<String?> getAccessToken() async {
    return await _storage.getString(NameConstant.accessTokenKey);
  }

  @override
  Future<void> setAccessToken(String accessToken) async {
    final result =
        await _storage.setString(NameConstant.accessTokenKey, accessToken);

    if (result == false) {
      throw Exception('Failed to set access token');
    }
  }
}
