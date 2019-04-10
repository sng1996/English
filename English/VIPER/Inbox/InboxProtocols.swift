//
//  InboxProtocols.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

protocol InboxViewProtocol: class {
    func update()
    func showEmptyView()
    func hideEmptyView()
    func showStartButton()
    func hideStartButton()
    func openTranslateView(with data: WordData)
}

protocol InboxPresenterProtocol: class {
    func configureView()
    func collectionViewDidSelectItemAt(_ indexPath: IndexPath)
    func collectionViewNumberOfItems() -> Int
    func collectionViewDataForItemAt(_ indexPath: IndexPath) -> WordCellDataModel
    func didTapStartButton()
}

protocol InboxInteractorProtocol: class {
    var numberOfItems: Int { get }
    var firstWords: [WordData] { get }
    func itemAt(_ index: Int) -> WordData
}

protocol InboxRouterProtocol: class {
    func presentStartViewController(with: [WordData])
}

protocol InboxConfiguratorProtocol: class {
    func configure(with viewController: InboxViewController)
}
