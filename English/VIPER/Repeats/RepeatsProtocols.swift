//
//  RepeatsProtocols.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

protocol RepeatsViewProtocol: class {
    func update()
    func showEmptyView()
    func hideEmptyView()
    func showStartButton()
    func hideStartButton()
    func openTranslateView(with data: WordData)
}

protocol RepeatsPresenterProtocol: class {
    func configureView()
    func tableViewDidSelectItemAt(_ indexPath: IndexPath)
    func tableViewNumberOfItems() -> Int
    func tableViewDataForItemAt(_ indexPath: IndexPath) -> RepeatsCellDataModel
    func didTapStartButton()
    func getBadgeValue() -> Int
}

protocol RepeatsInteractorProtocol: class {
    var todayWordsCount: Int { get }
    var firstWords: [WordData] { get }
    var isRepeat: Bool { get }
    func itemAt(_ index: Int) -> WordData
    func numberOfItems() -> Int
    //func requestAccessForNotifications()
}

protocol RepeatsRouterProtocol: class {
    func presentStartViewController(with data: [WordData])
}

protocol RepeatsConfiguratorProtocol: class {
    func configure(with viewController: RepeatsViewController)
}
