//
//  JBSecretManager.swift
//
//
//  Created by 이준복 on 9/3/24.
//

import Foundation

public enum JBSecretManager {
    
    enum SecretType: String {
        case accessToken
    }
    
    // MARK: - Write
    static func write(type: SecretType, data: Data) {
        let query = NSDictionary(dictionary: [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: type.rawValue,
            kSecValueData: data
        ])
        SecItemDelete(query)
        SecItemAdd(query, nil)
    }
    
    // MARK: - Read
    static func read(type: SecretType) -> Data? {
        let query = NSDictionary(dictionary: [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: type.rawValue,
            kSecReturnData: true,
            kSecMatchLimit: kSecMatchLimitOne
        ])
        var data: AnyObject?
        _ = withUnsafeMutablePointer(to: &data) {
            SecItemCopyMatching(query, UnsafeMutablePointer($0))
        }
        return data as? Data
    }
    
    // MARK: - Delete
    static func delete(type: SecretType) {
        guard let data = read(type: type) else { return }
        let query = NSDictionary(dictionary: [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: type.rawValue,
            kSecValueData: data
        ])
        SecItemDelete(query)
    }
    
}

