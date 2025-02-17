//
//  File.swift
//  JBKit
//
//  Created by 이준복 on 2/17/25.
//

import Foundation


public protocol AnyCancellableTask {
    func cancel()
}

extension Task: AnyCancellableTask {}


public final class CancelBag {
    
    private var cancellables: [AnyCancellableTask] = []
    
    public init() {}
    
    public func store(task: AnyCancellableTask) {
        cancellables.append(task)
    }
    
    public func cancel() {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
    }
    
    deinit { cancel() }
    
}

extension Task {
    
    public func store(in bag: CancelBag) {
        bag.store(task: self)
    }
    
}


