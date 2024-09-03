//
//  Dependency.swift
//  
//
//  Created by 이준복 on 8/26/24.
//

import Foundation

protocol EmptyDependency: AnyObject { }

protocol Dependency: AnyObject { }

protocol Parent: Dependency {
    associatedtype ParentDependency
    
    var dependecy: ParentDependency { get }
}

