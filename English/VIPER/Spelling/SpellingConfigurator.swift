//
//  SpellingConfigurator.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class SpellingConfigurator: SpellingConfiguratorProtocol {
    
    func configure(with viewController: SpellingViewController) {
        let presenter = SpellingPresenter(view: viewController)
        let interactor = SpellingInteractor(presenter: presenter)
        let router = SpellingRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
}
