//
//  AddConfigurator.swift
//  English
//
//  Created by Сергей Гаврилко on 26/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class AddConfigurator: AddConfiguratorProtocol {

    func configure(with viewController: AddViewController) {
        let presenter = AddPresenter(view: viewController)
        let interactor = AddInteractor(presenter: presenter)
        let router = AddRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }

}
