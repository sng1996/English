//
//  NewThemeConfigurator.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class NewThemeConfigurator: NewThemeConfiguratorProtocol {
    
    func configure(with viewController: NewThemeViewController) {
        let presenter = NewThemePresenter(view: viewController)
        let interactor = NewThemeInteractor(presenter: presenter)
        let router = NewThemeRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
}
