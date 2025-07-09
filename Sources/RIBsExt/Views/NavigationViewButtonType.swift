//
//  NavigationViewButtonType.swift
//  JBKit
//
//  Created by 이준복 on 5/25/25.
//

import UIKit

public enum NavigationViewButtonType {
    case back
    case close
    case home
    case setting
    case edit
    case delete
    case none
}

extension NavigationViewButtonType {
    
    var image: UIImage? {
        let config = UIImage.SymbolConfiguration(font: .systemFont(ofSize: 17, weight: .semibold))
        switch self {
        case .back:
            return UIImage(systemName: "chevron.backward", withConfiguration: config)
        case .close:
            return UIImage(systemName: "xmark", withConfiguration: config)
        case .home:
            return UIImage(systemName: "house", withConfiguration: config)
        case .setting:
            return UIImage(systemName: "gearshape", withConfiguration: config)
        case .edit:
            return UIImage(systemName: "pencil", withConfiguration: config)
        case .delete:
            return UIImage(systemName: "trash", withConfiguration: config)
        case .none:
            return nil
        }
    }
    
}
