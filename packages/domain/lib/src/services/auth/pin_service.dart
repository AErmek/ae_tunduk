abstract interface class PinService {
  Future<bool> hasPin();
  Future<void> savePin(String pin);
  Future<bool> verifyPin(String pin);

  Future<void> clear();
}
