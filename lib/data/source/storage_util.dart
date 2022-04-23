import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage_example/data/app_keys.dart';

class LocalSource1 {
  LocalSource1._();

  static SharedPreferences? _localStorage;

  static LocalSource1? _localSource;

  static LocalSource1 get instance => _localSource ?? LocalSource1._();

  static Future<void>  getInstance() async {
    if (_localStorage == null) {
      _localSource ??= LocalSource1._();
      _localStorage = await SharedPreferences.getInstance();
    }
  }

  Future<void> setShowIntro(bool isShow) async {
    await _localStorage?.setBool(AppKeys.isShow, isShow);
  }

  bool getShowIntro() {
    return _localStorage?.getBool(AppKeys.isShow) ?? false;
  }

  Future<void> setUserId(String userId) async {
    await _localStorage?.setString(AppKeys.userId, userId);
  }

  String getUserId() {
    return _localStorage?.getString(AppKeys.userId) ?? '';
  }

  Future<void> setPending(String pending) async {
    await _localStorage?.setString(AppKeys.pending, pending);
  }

  String getPending() {
    return _localStorage?.getString(AppKeys.pending) ?? '';
  }

  Future<void> setLock(String lock) async {
    await _localStorage?.setString(AppKeys.lock, lock);
  }

  String getLock() {
    return _localStorage?.getString(AppKeys.lock) ?? '';
  }
}
