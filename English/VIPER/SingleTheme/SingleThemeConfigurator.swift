//
//  SingleThemeConfigurator.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class SingleThemeConfigurator: SingleThemeConfiguratorProtocol {
    
    func configure(with viewController: SingleThemeViewController) {
        let presenter = SingleThemePresenter(view: viewController)
        let interactor = SingleThemeInteractor(presenter: presenter)
        let router = SingleThemeRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
}
