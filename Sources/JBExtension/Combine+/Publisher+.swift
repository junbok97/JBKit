//
//  Publisher+.swift
//
//
//  Created by 이준복 on 9/3/24.
//

import Combine

public extension Publisher {

    public func withUnretained<O: AnyObject>(_ object: O) -> Publishers.CompactMap<Self, (O, Self.Output)> {
        return compactMap { [weak object] output in
            guard let object else { return nil }
            return (object, output)
        }
    }
    
    public func withOnly<O: AnyObject>(_ object: O) -> Publishers.CompactMap<Self, O> {
        return compactMap { [weak object] _ in
            return object
        }
    }
    
}

