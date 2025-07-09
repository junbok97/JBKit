//
//  File.swift
//  JBKit
//
//  Created by 이준복 on 5/25/25.
//

import Foundation

public struct NavigationViewModel {
    
    let title: String
    let leftButtonType: NavigationViewButtonType
    let rightButtonTypes: [NavigationViewButtonType]
    
    public init(title: String, leftButtonType: NavigationViewButtonType, rightButtonTypes: [NavigationViewButtonType]) {
        self.title = title
        self.leftButtonType = leftButtonType
        self.rightButtonTypes = rightButtonTypes
    }
    
}
