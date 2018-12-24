//
//  TabBarModulesView.swift
//  English
//
//  Created by Сергей Гаврилко on 23/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

protocol TabBarModulesViewDelegate {
    func didTapThousands()
    func didTapThemes()
    func didTapProse()
}

class TabBarModulesView: UIView {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    var buttons: [Button] = [
        TabBarButton(item: TabBarButtonType.thousands),
        TabBarButton(item: TabBarButtonType.themes),
        TabBarButton(item: TabBarButtonType.prose)
    ]
    
    var delegate: TabBarModulesViewDelegate!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.layer.cornerRadius = 5
        self.layer.setShadow()
        self.isHidden = true
        setupViews()
    }
    
    func setupViews() {
        buttons[0].tapHandler = didTapThousands
        buttons[1].tapHandler = didTapThemes
        buttons[2].tapHandler = didTapProse
        
        addSubview(stackView)
        for button in buttons {
            stackView.addArrangedSubview(button)
        }
        
        addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: stackView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: stackView)
    }
    
    func deactivateButtons() {
        for button in buttons {
            if let button = button as? TabBarButton {
                button.deactivate()
            }
        }
    }
    
    func didTapThousands() {
        deactivateButtons()
        delegate.didTapThousands()
    }
    
    func didTapThemes() {
        deactivateButtons()
        delegate.didTapThemes()
    }
    
    func didTapProse() {
        deactivateButtons()
        delegate.didTapProse()
    }

}
