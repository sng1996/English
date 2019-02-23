//
//  ChoosingViewController.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ChoosingViewController: UIView {
    
    var presenter: ChoosingPresenterProtocol!
    var configurator: ChoosingConfiguratorProtocol = ChoosingConfigurator()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        configurator.configure(with: self)
        setupViews()
        presenter.configureView()
    }
    
    func setupViews() {
        
    }
    
}

extension ChoosingViewController: ChoosingViewProtocol {
    
}

