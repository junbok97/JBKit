//
//  ViewableRouting.swift
//  JBKit
//
//  Created by 이준복 on 2/17/25.
//

import UIKit
import RIBs

public extension ViewableRouting {
    
    func presentRouter(
        _ router: ViewableRouting,
        animated: Bool,
        completion: (() -> Void)? = nil
    ) {
        viewControllable.present(router.viewControllable, animated: animated, completion: completion)
        attachChild(router)
    }
    
    func dismissRouter(
        _ router: ViewableRouting,
        animated: Bool,
        completion: (() -> Void)? = nil
    ) {
        viewControllable.dismiss(animated: animated, completion: completion)
        detachChild(router)
    }
    
    func pushRouter(
        _ router: ViewableRouting,
        animated: Bool
    ) {
        viewControllable.pushViewController(router.viewControllable, animated: animated)
        attachChild(router)
    }
    
    func popRouter(
        _ router: ViewableRouting,
        animated: Bool,
        isSwipeBack: Bool = false,
        completion: (() -> Void)? = nil
    ) {
        isSwipeBack ? detachChild(router) : viewControllable.popViewController(
            router.viewControllable,
            animated: animated,
            completion: completion
        )
    }
    
    func setRouters(_ routers: [ViewableRouting], animated: Bool) {
        viewControllable.setViewControllers(routers.map(\.viewControllable), animated: animated)
        routers.forEach(attachChild)
    }
    
}

