abstract interface class BiometricService {
  Future<bool> canUseBiometric();
  Future<void> enableBiometric();
  Future<bool> isBiometricEnabled();
  Future<bool> authenticateWithBiometric();
}
