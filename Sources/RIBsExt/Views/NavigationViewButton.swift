//
//  NavigationViewButton.swift
//  JBKit
//
//  Created by 이준복 on 5/25/25.
//

import UIKit

public final class NavigationViewButton: UIButton {
    
    public var type: NavigationViewButtonType = .none {
        didSet { setImage(type.image?.withRenderingMode(.alwaysTemplate), for: .normal) }
    }
    
    public override var isHighlighted: Bool {
        didSet { tintColor = isHighlighted ? .systemGray3 : .black }
    }
    
}


