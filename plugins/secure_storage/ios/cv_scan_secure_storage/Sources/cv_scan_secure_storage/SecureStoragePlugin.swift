import Flutter
import UIKit

/// Keychain-backed implementation of the Pigeon `SecureStorageApi`.
///
/// Keychain operations are synchronous and run on the platform thread the
/// channel handler is invoked on; failures surface to Dart as a `PigeonError`.
public class SecureStoragePlugin: NSObject, FlutterPlugin, SecureStorageApi {
  private let store = KeychainStore(
    service: "kg.ae.cv_scan.secure_storage",
    accessibility: kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly
  )

  public static func register(with registrar: FlutterPluginRegistrar) {
    let instance = SecureStoragePlugin()
    SecureStorageApiSetup.setUp(binaryMessenger: registrar.messenger(), api: instance)
  }

  func read(key: String, completion: @escaping (Result<String?, Error>) -> Void) {
    completion(runCatching { try store.read(key: key) })
  }

  func write(key: String, value: String, completion: @escaping (Result<Void, Error>) -> Void) {
    completion(runCatching { try store.write(key: key, value: value) })
  }

  func delete(key: String, completion: @escaping (Result<Void, Error>) -> Void) {
    completion(runCatching { try store.delete(key: key) })
  }

  func deleteAll(completion: @escaping (Result<Void, Error>) -> Void) {
    completion(runCatching { try store.deleteAll() })
  }

  func containsKey(key: String, completion: @escaping (Result<Bool, Error>) -> Void) {
    completion(runCatching { try store.contains(key: key) })
  }

  private func runCatching<T>(_ action: () throws -> T) -> Result<T, Error> {
    do {
      return .success(try action())
    } catch {
      return .failure(error)
    }
  }
}
