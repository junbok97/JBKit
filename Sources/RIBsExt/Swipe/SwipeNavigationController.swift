//
//  SwipeNavigationController.swift
//  JBKit
//
//  Created by 이준복 on 2/17/25.
//

import UIKit

final class SwipeNavigationController: UINavigationController {
    
    private var isAnimating = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = true
        interactivePopGestureRecognizer?.delegate = self
        self.delegate = self
    }
    
    override func pushViewController(
        _ viewController: UIViewController,
        animated: Bool
    ) {
        isAnimating = true
        super.pushViewController(viewController, animated: animated)
    }
    
}

extension SwipeNavigationController: UINavigationControllerDelegate {
    
    func navigationController(
        _ navigationController: UINavigationController,
        didShow viewController: UIViewController,
        animated: Bool
    ) {
        isAnimating = false
    }
    
}

extension SwipeNavigationController: UIGestureRecognizerDelegate {
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1 && !isAnimating
    }
    
}
