//
//  RepeatsConfigurator.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class RepeatsConfigurator: RepeatsConfiguratorProtocol {
    
    func configure(with viewController: RepeatsViewController) {
        let presenter = RepeatsPresenter(view: viewController)
        let interactor = RepeatsInteractor(presenter: presenter)
        let router = RepeatsRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
}
