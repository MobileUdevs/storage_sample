import 'package:get_storage/get_storage.dart';
import 'package:storage_example/data/app_keys.dart';

class LocalSource2 {
  LocalSource2._();

  static final GetStorage _localStorage = GetStorage();

  static LocalSource2? _localSource;

  static LocalSource2 getInstance() => _localSource ?? LocalSource2._();
  static LocalSource2 get instance => _localSource ?? LocalSource2._();

  Future<void> setShowIntro(bool isShow) async {
    await _localStorage.write(AppKeys.isShow, isShow);
  }

  bool getShowIntro() {
    return _localStorage.read<bool>(AppKeys.isShow) ?? false;
  }

  Future<void> setUserId(String userId) async {
    await _localStorage.write(AppKeys.userId, userId);
  }

  String getUserId() {
    return _localStorage.read<String>(AppKeys.userId) ?? '';
  }

  Future<void> setPending(String pending) async {
    await _localStorage.write(AppKeys.pending, pending);
  }

  String getPending() {
    return _localStorage.read(AppKeys.pending) ?? '';
  }

  Future<void> setLock(String lock) async {
    await _localStorage.write(AppKeys.lock, lock);
  }

  String getLock() {
    return _localStorage.read<String>(AppKeys.lock) ?? '';
  }
}
