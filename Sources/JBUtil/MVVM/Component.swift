//
//  Component.swift
//
//
//  Created by 이준복 on 8/26/24.
//

import Foundation

public class EmptyComponent: EmptyDependency {
    init() {}
}

public class Component<ParentDependency>: Parent {
    public let dependecy: ParentDependency
    
    public init(dependecy: ParentDependency) {
        self.dependecy = dependecy
    }
}

