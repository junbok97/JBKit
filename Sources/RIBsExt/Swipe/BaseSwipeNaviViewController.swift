//
//  BaseSwipeNaviViewController.swift
//  JBKit
//
//  Created by 이준복 on 5/25/25.
//


import UIKit
import Combine

open class BaseSwipeNaviViewController: UIViewController {
    
    public let navigationView = NavigationView()
    public var cancellables = Set<AnyCancellable>()
    public var isPopGestureEnabled: Bool = true {
        didSet {
            navigationController?.interactivePopGestureRecognizer?.isEnabled = isPopGestureEnabled
        }
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupAttributes()
        bind()
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if isMovingFromParent {
            navigationView.sendCloseEvent()
        }
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = isPopGestureEnabled
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    open func setupLayout() {
        view.addSubview(navigationView)
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    open func setupAttributes() {}
    open func bind() {}
    
}

