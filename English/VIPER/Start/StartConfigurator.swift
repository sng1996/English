//
//  StartConfigurator.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class StartConfigurator: StartConfiguratorProtocol {
    
    func configure(with viewController: StartViewController, data: [WordData]) {
        let presenter = StartPresenter(view: viewController)
        let interactor = StartInteractor(presenter: presenter, data: data)
        let router = StartRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
}
