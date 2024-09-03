//
//  ViewControllable.swift
//
//
//  Created by 이준복 on 8/26/24.
//

import UIKit

public protocol ViewControllable: AnyObject {
    var uiviewController: UIViewController { get }
}


public extension ViewControllable {
    
    func pushViewController(_ viewControllable: ViewControllable, animated: Bool) {
        self.uiviewController.navigationController?.pushViewController(
            viewControllable.uiviewController,
            animated: animated
        )
    }
    
    func popViewController(animated: Bool) {
        self.uiviewController.navigationController?.popViewController(animated: animated)
    }
    
    func popToRootViewController(animated: Bool) {
        self.uiviewController.navigationController?.popToRootViewController(animated: animated)
    }
    
    func dismiss(animated: Bool, completion: (() -> Void)? = nil) {
        self.uiviewController.dismiss(animated: animated, completion: completion)
    }
    
}


public extension ViewControllable where Self: UIViewController {
    
    var uiviewController: UIViewController {
        return self
    }
    
}


public final class NavigationControllable: ViewControllable {
    
    public var uiviewController: UIViewController { return self.navigationController }
    public var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
    
    public init(root: ViewControllable) {
        self.navigationController = UINavigationController(rootViewController: root.uiviewController)
        navigationController.isNavigationBarHidden = true
    }
    
}
