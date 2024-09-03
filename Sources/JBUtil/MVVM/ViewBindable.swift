//
//  ViewBindable.swift
//  
//
//  Created by 이준복 on 8/13/24.
//

import Foundation

public protocol ViewBindable {
    associatedtype State
    associatedtype OutputError: Error
    
    func bind()
    func render(_ state: State)
    func handleError(_ error: OutputError)
}

public extension ViewBindable {
    func handleError(_ error: OutputError) { }
}

