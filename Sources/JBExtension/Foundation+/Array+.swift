//
//  Array+.swift
//
//
//  Created by 이준복 on 9/3/24.
//

import Foundation

public extension Array {
    
    subscript(safe index: Int) -> Element? {
        self.indices ~= index ? self[index] : nil
    }
    
}
