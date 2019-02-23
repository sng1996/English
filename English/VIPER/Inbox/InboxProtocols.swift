//
//  InboxProtocols.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

protocol InboxViewProtocol: class {
    func viewDidAppear()
    func update()
    func showEmptyView()
    func hideEmptyView()
    func showStartButton()
    func hideStartButton()
    func openTranslateView(with model: TranslateViewDataModel)
}

protocol InboxPresenterProtocol: class {
    func configureView()
    func collectionViewDidSelectItemAt(_ indexPath: IndexPath)
    func collectionViewNumberOfItems() -> Int
    func collectionViewDataForItemAt(_ indexPath: IndexPath) -> WordCellDataModel
    func updateView()
}

protocol InboxInteractorProtocol: class {
    
}

protocol InboxRouterProtocol: class {
    
}

protocol InboxConfiguratorProtocol: class {
    func configure(with viewController: InboxViewController)
}
