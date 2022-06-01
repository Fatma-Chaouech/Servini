enum StorageKey {
  NAME,
  SURNAME
}

extension ParseStorageKeyToStringValue on StorageKey {
  String get value {
    return this.toString().split('.').last;
  }
}