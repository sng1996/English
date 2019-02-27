//
//  ChoosingConfigurator.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ChoosingConfigurator: ChoosingConfiguratorProtocol {
    
    func configure(with viewController: ChoosingViewController, data: [WordData]) {
        let presenter = ChoosingPresenter(view: viewController)
        let interactor = ChoosingInteractor(presenter: presenter, data: data)
        let router = ChoosingRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
}
