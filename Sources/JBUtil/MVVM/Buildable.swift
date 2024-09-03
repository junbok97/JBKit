//
//  Buildable.swift
//
//
//  Created by 이준복 on 8/26/24.
//

import Foundation

public protocol Buildable: AnyObject { }

public class Builder<ParentDependency> {
    public let dependency: ParentDependency
    
    public init(dependency: ParentDependency) {
        self.dependency = dependency
    }
}

