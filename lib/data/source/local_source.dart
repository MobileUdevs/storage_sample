import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:storage_example/data/app_keys.dart';

class LocalSource {
  LocalSource._();

  static Box? _localStorage;

  static LocalSource? _localSource;

  static LocalSource get instance => _localSource ?? LocalSource._();

  static Future<void> getInstance() async {
    if (_localStorage == null) {
      _localSource ??= LocalSource._();
      _localStorage = await Hive.openBox(AppKeys.localSource);
    }
  }

  Future<void> setShowIntro(bool isShow) async {
    await _localStorage?.put(AppKeys.isShow, isShow);
  }

  bool getShowIntro() {
    return _localStorage?.get(AppKeys.isShow, defaultValue: false) ?? false;
  }

  Future<void> setUserId(String userId) async {
    await _localStorage?.put(AppKeys.userId, userId);
  }

  String getUserId() {
    return _localStorage?.get(AppKeys.userId, defaultValue: "") ?? '';
  }

  Future<void> setPending(String pending) async {
    await _localStorage?.put(AppKeys.pending, pending);
  }

  String getPending() {
    return _localStorage?.get(AppKeys.pending, defaultValue: "") ?? '';
  }

  Future<void> setLock(String lock) async {
    await _localStorage?.put(AppKeys.lock, lock);
  }

  String getLock() {
    return _localStorage?.get(AppKeys.lock, defaultValue: "") ?? '';
  }

  Future<void> setCountry(String country) async {
    await _localStorage?.put(AppKeys.country, country);
  }

  String getCountry() {
    return _localStorage?.get(AppKeys.country, defaultValue: "") ?? '';
  }

  Future<void> removeProfile() async {
    await _localStorage?.delete(AppKeys.hasProfile);
    await _localStorage?.delete(AppKeys.userId);
    await _localStorage?.delete(AppKeys.country);
    await _localStorage?.delete(AppKeys.user);
    await _localStorage?.delete(AppKeys.locale);
    await _localStorage?.delete(AppKeys.lock);
    await _localStorage?.delete(AppKeys.accessToken);
    await _localStorage?.delete(AppKeys.pending);
  }

  bool hasProfile() {
    return _localStorage?.get(AppKeys.hasProfile, defaultValue: false) ?? false;
  }

  String getAccessToken() {
    return _localStorage?.get(AppKeys.accessToken, defaultValue: "") ?? '';
  }

  String getLocale() {
    return _localStorage?.get(
      AppKeys.locale,
      defaultValue: "en",
    );
  }

  Future<void> setLocale(String value) async {
    await _localStorage?.put(AppKeys.locale, value);
  }

  Future<void> setFcmToken(String value) async {
    await _localStorage?.put(AppKeys.fcmToken, value);
  }

  String getFcmToken() {
    return _localStorage?.get(AppKeys.fcmToken, defaultValue: "") ?? '';
  }

  Future<void> setRefreshedTokens({
    required String? refreshToken,
    required String? accessToken,
  }) async {
    await _localStorage?.put(AppKeys.accessToken, accessToken ?? '');
  }
}
