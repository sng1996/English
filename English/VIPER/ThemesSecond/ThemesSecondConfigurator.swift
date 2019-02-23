//
//  ThemesSecondConfigurator.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ThemesSecondConfigurator: ThemesSecondConfiguratorProtocol {
    
    func configure(with viewController: ThemesSecondViewController) {
        let presenter = ThemesSecondPresenter(view: viewController)
        let interactor = ThemesSecondInteractor(presenter: presenter)
        let router = ThemesSecondRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
}
