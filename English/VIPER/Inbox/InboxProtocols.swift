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
}

protocol InboxPresenterProtocol: class {
    func configureView()
    func collectionViewDidSelectItemAt(_ indexPath: IndexPath)
    func collectionViewNumberOfItems() -> Int
    func collectionViewDataForItemAt(_ indexPath: IndexPath) -> WordCellDataModel
    func scrollViewDidScroll(contentOffset: CGFloat)
    func scrollViewDidEndDragging(contentOffset: CGFloat)
    func scrollViewWillBeginDragging()
}

protocol InboxInteractorProtocol: class {
    var numberOfItems: Int { get }
    func itemAt(_ index: Int) -> WordData
}

protocol InboxRouterProtocol: class {
    func presentTranslateViewController(with data: WordData)
    func presentAddViewController()
    func addViewDidDragging(_ contentOffset: CGFloat)
    func addViewDidEndDragging(_ contentOffset: CGFloat)
}

protocol InboxConfiguratorProtocol: class {
    func configure(with viewController: InboxViewController)
}
