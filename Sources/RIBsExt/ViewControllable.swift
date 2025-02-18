//
//  ViewControllable.swift
//  JBKit
//
//  Created by 이준복 on 2/17/25.
//

import UIKit
import RIBs


public extension ViewControllable {

    func present(
        _ viewControllable: ViewControllable,
        animated: Bool,
        completion: (() -> Void)? = nil
    ) {
        uiviewController.present(viewControllable.uiviewController, animated: animated, completion: completion)
    }
    
    func pushViewController(_ viewControllable: ViewControllable, animated: Bool) {
        if let nav = self.uiviewController as? UINavigationController {
            nav.pushViewController(viewControllable.uiviewController, animated: animated)
        } else {
            self.uiviewController.navigationController?.pushViewController(viewControllable.uiviewController, animated: animated)
        }
    }
    
    func setViewControllers(_ viewControllables: [ViewControllable], animated: Bool) {
        if let navigationController = uiviewController as? UINavigationController {
            navigationController.setViewControllers(viewControllables.map(\.uiviewController), animated: animated)
        } else {
            uiviewController.navigationController?.setViewControllers(viewControllables.map(\.uiviewController), animated: animated)
        }
    }

    func dismiss(animated: Bool, completion: (() -> Void)?) {
        self.uiviewController.resign()
        self.uiviewController.dismiss(animated: animated, completion: completion)
    }
    
    func popViewController(animated: Bool) {
        if let navigationController = uiviewController as? UINavigationController {
            navigationController.topViewController?.resign()
            navigationController.popViewController(animated: animated)
        } else {
            uiviewController.navigationController?.topViewController?.resign()
            uiviewController.navigationController?.popViewController(animated: animated)
        }
    }
    
    func popToRoot(animated: Bool) {
        if let nav = self.uiviewController as? UINavigationController {
            nav.popToRootViewController(animated: animated)
        } else {
            self.uiviewController.navigationController?.popToRootViewController(animated: animated)
        }
    }
    
}

private extension UIViewController {
    
    /// 'resign'은 RIBs Keyboard Memory Leak 을 해결하기 위한 메소드 입니다.
    ///
    /// 'resign'은 ViewController가 pop 또는 dismiss 되기 전에 호출하여 Keyboard에 대한 소유권을 잃게 합니다.
    /// 연관 링크: https://github.com/boostcampwm2023/iOS04-HeatPick/issues/149
    func resign() {
        view.endEditing(true)
    }
    
}

