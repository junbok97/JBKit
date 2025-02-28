//
//  File.swift
//  JBKit
//
//  Created by 이준복 on 2/28/25.
//


import UIKit

public final class Resource<Base> {
    public let base: Base

    public init(_ base: Base) {
        self.base = base
    }
}

public protocol ResourceSupports {
    associatedtype CompatibleType

    static var resource: Resource<CompatibleType>.Type { get set }
}

public extension ResourceSupports {
    static var dongwon: Resource<Self>.Type {
        get {
            Resource<Self>.self
        }
        set {}
    }
}



public extension Resource where Base == UIImage { }

public extension Resource where Base == UIColor { }
