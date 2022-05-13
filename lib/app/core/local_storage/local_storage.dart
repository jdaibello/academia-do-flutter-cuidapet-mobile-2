abstract class LocalStorage {
  Future<V?> read<V>(String key);
  Future<void> write<V>(String key, String value);
  Future<bool> contains(String key);
  Future<void> clear();
  Future<void> remove(String key);
}

abstract class LocalSecureStorage {
  Future<String?> read(String key);
  Future<void> write(String key, String value);
  Future<bool> contains(String key);
  Future<void> clear();
  Future<void> remove(String key);
}
