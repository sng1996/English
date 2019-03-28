//
//  LyricsConfigurator.swift
//  English
//
//  Created by Сергей Гаврилко on 28/03/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class LyricsConfigurator: LyricsConfiguratorProtocol {
    
    func configure(with viewController: LyricsViewController, data: Song) {
        let presenter = LyricsPresenter(view: viewController)
        let interactor = LyricsInteractor(presenter: presenter, data: data)
        let router = LyricsRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
}
