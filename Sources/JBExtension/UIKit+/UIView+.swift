//
//  UIView+.swift
//
//
//  Created by 이준복 on 9/3/24.
//

import UIKit

public extension UIView {
    
    func addSubviews(_ views: UIView ...) {
        views.forEach { addSubview($0) }
    }
    
    func roundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
    
}

