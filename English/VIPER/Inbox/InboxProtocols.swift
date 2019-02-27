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
    func showRememberHint()
}

protocol InboxPresenterProtocol: class {
    func configureView()
    func isShowCountHint() -> Bool
    func collectionViewDidSelectItemAt(_ indexPath: IndexPath)
    func collectionViewNumberOfItems() -> Int
    func collectionViewDataForItemAt(_ indexPath: IndexPath) -> WordCellDataModel
    func scrollViewDidScroll(contentOffset: CGFloat)
    func scrollViewDidEndDragging(contentOffset: CGFloat)
    func scrollViewWillBeginDragging()
    func didTapStartButton()
    func didSuccessfullyFinishStartView(with data: [WordData])
    func didSuccessfullyFinishChoosingView(with data: [WordData])
    func rememberHintDidTapAcceptButton()
}

protocol InboxInteractorProtocol: class {
    var numberOfItems: Int { get }
    var firstWords: [WordData] { get }
    var isShowNotificationHint: Bool { get }
    var isShowStartHint: Bool { get }
    var isShowCountHint: Bool { get }
    func itemAt(_ index: Int) -> WordData
    func requestAccessForNotifications()
}

protocol InboxRouterProtocol: class {
    func presentStartViewController(with: [WordData])
    func presentChoosingViewController(with data: [WordData])
    func presentSpellingViewController(with data: [WordData])
    func presentTranslateViewController(with data: WordData)
    func presentAddViewController()
    func addViewDidDragging(_ contentOffset: CGFloat)
    func addViewDidEndDragging(_ contentOffset: CGFloat)
}

protocol InboxConfiguratorProtocol: class {
    func configure(with viewController: InboxViewController)
}
