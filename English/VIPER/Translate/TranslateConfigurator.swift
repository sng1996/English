//
//  TranslateConfigurator.swift
//  English
//
//  Created by Сергей Гаврилко on 25/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class TranslateConfigurator: TranslateConfiguratorProtocol {

    func configure(with viewController: TranslateViewController, data: WordData) {
        let presenter = TranslatePresenter(view: viewController)
        let interactor = TranslateInteractor(presenter: presenter, data: data)
        let router = TranslateRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }

}
