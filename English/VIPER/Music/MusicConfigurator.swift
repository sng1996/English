//
//  MusicConfigurator.swift
//  English
//
//  Created by Сергей Гаврилко on 27/03/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class MusicConfigurator: MusicConfiguratorProtocol {
    
    func configure(with viewController: MusicViewController) {
        let presenter = MusicPresenter(view: viewController)
        let interactor = MusicInteractor(presenter: presenter)
        let router = MusicRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
}
