//
//  Optional+.swift
//  
//
//  Created by 이준복 on 9/3/24.
//

import Foundation

public extension Optional<Character> {
    var value: String {
        switch self {
        case .none:
            return ""
        case let .some(wrapped):
            return wrapped
        }
    }
}


public extension Optional<String> {
    var value: String {
        switch self {
        case .none:
            return ""
        case let .some(wrapped):
            return wrapped
        }
    }
}

public extension Optional<Int> {
    var value: Int {
        switch self {
        case .none:
            return 0
        case let .some(wrapped):
            return wrapped
        }
    }
}

public extension Optional<Double> {
    var value: Double {
        switch self {
        case .none:
            return 0
        case let .some(wrapped):
            return wrapped
        }
    }
}

