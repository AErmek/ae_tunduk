import Foundation
import Security

/// Thin wrapper over the iOS Keychain (`kSecClassGenericPassword`).
///
/// The Keychain itself encrypts items at rest; values are scoped to a single
/// service and bound to this device with the configured accessibility class.
struct KeychainStore {
  let service: String
  let accessibility: CFString

  func write(key: String, value: String) throws {
    SecItemDelete(baseQuery(account: key) as CFDictionary)
    var attributes = baseQuery(account: key)
    attributes[kSecValueData as String] = Data(value.utf8)
    attributes[kSecAttrAccessible as String] = accessibility
    try check(SecItemAdd(attributes as CFDictionary, nil))
  }

  func read(key: String) throws -> String? {
    var query = baseQuery(account: key)
    query[kSecReturnData as String] = kCFBooleanTrue
    query[kSecMatchLimit as String] = kSecMatchLimitOne

    var item: CFTypeRef?
    let status = SecItemCopyMatching(query as CFDictionary, &item)
    if status == errSecItemNotFound { return nil }
    try check(status)

    guard let data = item as? Data else { return nil }
    return String(data: data, encoding: .utf8)
  }

  func delete(key: String) throws {
    let status = SecItemDelete(baseQuery(account: key) as CFDictionary)
    if status == errSecItemNotFound { return }
    try check(status)
  }

  func deleteAll() throws {
    let query: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrService as String: service,
    ]
    let status = SecItemDelete(query as CFDictionary)
    if status == errSecItemNotFound { return }
    try check(status)
  }

  func contains(key: String) throws -> Bool {
    let status = SecItemCopyMatching(baseQuery(account: key) as CFDictionary, nil)
    switch status {
    case errSecSuccess: return true
    case errSecItemNotFound: return false
    default:
      try check(status)
      return false
    }
  }

  private func baseQuery(account: String) -> [String: Any] {
    [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrService as String: service,
      kSecAttrAccount as String: account,
    ]
  }

  private func check(_ status: OSStatus) throws {
    guard status == errSecSuccess else {
      throw PigeonError(
        code: "keychain_error",
        message: "Keychain operation failed",
        details: "OSStatus \(status)"
      )
    }
  }
}
