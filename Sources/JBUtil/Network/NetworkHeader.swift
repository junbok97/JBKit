//
//  NetworkHeader.swift
//
//
//  Created by 이준복 on 9/3/24.
//

import Foundation

public class NetworkHeader {
    
    public static var `default`: NetworkHeader {
        return NetworkHeader().withJSON()
    }
    
    public var headers: [String: String] = [:]
    
    @discardableResult
    public func contentType(_ value: String) -> Self {
        headers["Content-Type"] = value
        return self
    }
    
    @discardableResult
    public func accept(_ value: String) -> Self {
        headers["Accept"] = value
        return self
    }
    
    @discardableResult
    public func authorization(_ value: String, usingBearer: Bool = true) -> Self {
        headers["Authorization"] = usingBearer ? "Bearer \(value)" : value
        return self
    }
    
    @discardableResult
    public func withJSON() -> Self {
        contentType("application/json")
        return self
    }
    
    @discardableResult
    public func customHeaders(_ keyValues: [(key: String, value: String)]) -> Self {
        keyValues.forEach { key, value in
            headers[key] = value
        }
        return self
    }
    
}

