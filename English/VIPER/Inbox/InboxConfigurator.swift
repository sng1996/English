//
//  InboxConfigurator.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class InboxConfigurator: InboxConfiguratorProtocol {
    
    func configure(with viewController: InboxViewController) {
        let presenter = InboxPresenter(view: viewController)
        let interactor = InboxInteractor(presenter: presenter)
        let router = InboxRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
}
