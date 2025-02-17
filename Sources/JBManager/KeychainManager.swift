//
//  KeychainManager.swift


//
//  Created by 이준복 on 8/13/24.
//

import Foundation

enum KeychainManagerError: Error {
    case readFail(KeychainManagerKey)
}

enum KeychainManagerKey: String {
    
    var value: String { rawValue }
    
    case accessToken
    case refreshToken
}

enum KeychainManager {

    // MARK: - Write
    static func write(data: Data, key: KeychainManagerKey) {
        let query = NSDictionary(dictionary: [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key.value,
            kSecValueData: data
        ])
        SecItemDelete(query)
        SecItemAdd(query, nil)
    }
    
    static func write(str: String, key: KeychainManagerKey) {
        let query = NSDictionary(dictionary: [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key.value,
            kSecValueData: str.data(using: .utf8) as Any
        ])
        SecItemDelete(query)
        SecItemAdd(query, nil)
    }
    
    // MARK: - Read
    static func read(key: KeychainManagerKey) throws -> Data {
        let query = NSDictionary(dictionary: [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key.value,
            kSecReturnData: true,
            kSecMatchLimit: kSecMatchLimitOne
        ])
        var anyObject: AnyObject?
        _ = withUnsafeMutablePointer(to: &anyObject) {
            SecItemCopyMatching(query, UnsafeMutablePointer($0))
        }
        
        guard let data = anyObject as? Data else {
            throw KeychainManagerError.readFail(key)
        }
        
        return data
    }

    
    // MARK: - Delete
    static func delete(key: KeychainManagerKey) {
        guard let data = try? read(key: key) else { return }
        let query = NSDictionary(dictionary: [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key.value,
            kSecValueData: data
        ])
        SecItemDelete(query)
    }
    
}
