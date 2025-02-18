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
        interactivePopGestureRecognizer?.delegate = self
        self.delegate = self
        self.view.backgroundColor = .white
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.shadowColor = .white
        appearance.titleTextAttributes = [
            .font: UIFont.pretendard(ofSize: 17, weight: .medium),
            .foregroundColor: UIColor.dwDefaultTextColor
        ]
        
        
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        isAnimating = true
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        super.popViewController(animated: animated)
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
        
        let result = viewControllers.count > 1 && !isAnimating
        if result,
           let viewController = viewControllers.last as? SwipeBackable {
            viewController.detachSwipeBack()
        }
        return result
    }
    
}



