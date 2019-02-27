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
    func openTranslateView(with model: TranslateViewDataModel)
}

protocol RepeatsPresenterProtocol: class {
    func configureView()
    func tableViewDidSelectItemAt(_ indexPath: IndexPath)
    func tableViewNumberOfItems() -> Int
    func tableViewDataForItemAt(_ indexPath: IndexPath) -> RepeatsCellDataModel
    func didTapStartButton()
    func didSuccessfullyFinishStartView(with data: [WordData])
    func didSuccessfullyFinishChoosingView(with data: [WordData])
}

protocol RepeatsInteractorProtocol: class {
    var todayWordsCount: Int { get }
    var firstWords: [WordData] { get }
    func itemAt(_ index: Int) -> WordData
    func numberOfItems() -> Int
}

protocol RepeatsRouterProtocol: class {
    func presentStartViewController(with data: [WordData])
    func presentChoosingViewController(with data: [WordData])
    func presentSpellingViewController(with data: [WordData])
    func presentTranslateViewController(with data: WordData)
}

protocol RepeatsConfiguratorProtocol: class {
    func configure(with viewController: RepeatsViewController)
}
