//
//  NavigationControllable.swift
//  JBKit
//
//  Created by 이준복 on 2/17/25.
//

import UIKit
import RIBs

public final class NavigationControllable: ViewControllable {
    
    public var uiviewController: UIViewController { navigationController }
    public let navigationController: UINavigationController
    
    public init(viewControllable: ViewControllable, tabBarItem: UITabBarItem?) {
        let navigationController = SwipeNavigationController(rootViewController: viewControllable.uiviewController)
        navigationController.navigationBar.isTranslucent = false
        navigationController.tabBarItem = tabBarItem
        self.navigationController = navigationController
    }
    
}


