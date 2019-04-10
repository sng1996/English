//
//  TranslateConfigurator.swift
//  English
//
//  Created by Сергей Гаврилко on 25/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class TranslateConfigurator: TranslateConfiguratorProtocol {

    func configure(with view: TranslateView, data: WordData) {
        let presenter = TranslatePresenter(view: view)
        let interactor = TranslateInteractor(presenter: presenter, data: data)
        let router = TranslateRouter(view: view)
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }

}
