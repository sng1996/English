//
//  RepeatsProtocols.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

protocol RepeatsViewProtocol: class {
    func viewDidAppear()
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
}

protocol RepeatsInteractorProtocol: class {
    var todayWordsCount: Int
    func itemAt(_ index: Int) -> WordData
    func numberOfItems() -> Int
}

protocol RepeatsRouterProtocol: class {
    
}

protocol RepeatsConfiguratorProtocol: class {
    func configure(with viewController: RepeatsViewController)
}
