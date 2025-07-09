//
//  File.swift
//  JBKit
//
//  Created by 이준복 on 5/25/25.
//

import UIKit

public protocol SwipeBackable {
    func detachSwipeBack()
}


public final class SwipeBackableNavigationController: UINavigationController {

    private var isAnimating = false
    // 잠재적으로 팝될 뷰 컨트롤러를 저장합니다.
    private var potentialPoppedViewController: UIViewController?

    public override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        interactivePopGestureRecognizer?.delegate = self
    }

    public override func pushViewController(
        _ viewController: UIViewController,
        animated: Bool
    ) {
        super.pushViewController(viewController, animated: animated)
        isAnimating = true
    }
}


extension SwipeBackableNavigationController: UINavigationControllerDelegate {

    public func navigationController(
        _ navigationController: UINavigationController,
        didShow viewController: UIViewController,
        animated: Bool
    ) {
        isAnimating = false

        if let poppedVC = self.potentialPoppedViewController,
           !navigationController.viewControllers.contains(poppedVC) {
            if let swipeBackable = poppedVC as? SwipeBackable {
                swipeBackable.detachSwipeBack()
            }
        }
        self.potentialPoppedViewController = nil
    }
}


extension SwipeBackableNavigationController: UIGestureRecognizerDelegate {

    public func gestureRecognizerShouldBegin(
        _ gestureRecognizer: UIGestureRecognizer
    ) -> Bool {
        let result = viewControllers.count > 1 && !isAnimating

        if result {
            self.potentialPoppedViewController = self.topViewController
        }
        return result
    }
}

