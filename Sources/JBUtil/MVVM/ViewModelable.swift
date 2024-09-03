//
//  ViewModelable.swift
//  
//
//  Created by 이준복 on 8/13/24.
//

import Foundation

public protocol ViewModelable {
    associatedtype Input
    associatedtype State
    associatedtype Output
    
    func transform(_ input: Input) -> Output
}

