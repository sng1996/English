//
//  ResultConfigurator.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ResultConfigurator: ResultConfiguratorProtocol {
    
    func configure(with viewController: ResultViewController) {
        let presenter = ResultPresenter(view: viewController)
        let interactor = ResultInteractor(presenter: presenter)
        let router = ResultRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
}
