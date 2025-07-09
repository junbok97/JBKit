//
//  NavigationView.swift
//  JBKit
//
//  Created by 이준복 on 5/25/25.
//

import UIKit

public protocol NavigationViewDelegate: AnyObject {
    func navigationViewButtonDidTap(_ view: NavigationView, type: NavigationViewButtonType)
}

public final class NavigationView: UIView {
    
    public weak var delegate: NavigationViewDelegate?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var leftButton = makeNavigationViewButton(action: #selector(leftButtonDidTap))
    
    private let rightButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .trailing
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    public func setup(model: NavigationViewModel) {
        titleLabel.text = model.title
        leftButton.type = model.leftButtonType
        
        rightButtonStackView.subviews.forEach { $0.removeFromSuperview() }
        model.rightButtonTypes
            .forEach { type in
                let button = makeNavigationViewButton(action: #selector(rightButtonDidTap))
                button.type = type
                rightButtonStackView.addArrangedSubview(button)
            }
    }
    
    public func updateTitle(_ title: String) {
        titleLabel.text = title
    }
    
    public func showSeparator() {
        separator.isHidden = false
    }
    
    public func hideSeparator() {
        separator.isHidden = true
    }
    
    public func sendCloseEvent() {
        leftButton.sendActions(for: .touchUpInside)
    }
    
}

private extension NavigationView {
    
    func setupViews() {
        backgroundColor = .white
        [
            titleLabel,
            leftButton,
            rightButtonStackView,
            separator
        ].forEach(addSubview)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            leftButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            leftButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            rightButtonStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            rightButtonStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            separator.leadingAnchor.constraint(equalTo: leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor),
            separator.bottomAnchor.constraint(equalTo: bottomAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func makeNavigationViewButton(action: Selector) -> NavigationViewButton {
        let button = NavigationViewButton()
        button.tintColor = .black
        button.contentMode = .center
        button.addTarget(self, action: action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }
    
}

private extension NavigationView {
    
    @objc func leftButtonDidTap() {
        delegate?.navigationViewButtonDidTap(self, type: leftButton.type)
    }
    
    @objc func rightButtonDidTap(_ sender: UIButton) {
        guard let navigationButton = sender as? NavigationViewButton else { return }
        delegate?.navigationViewButtonDidTap(self, type: navigationButton.type)
    }
    
}

