//
//  UIStackView+.swift
//
//
//  Created by 이준복 on 9/3/24.
//

import UIKit

public extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView ...) {
        views.forEach { addArrangedSubview($0) }
    }
    
}

