//
//  StartProtocols.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

protocol StartViewProtocol: class {
    func viewDidAppear()
    func update()
}

protocol StartPresenterProtocol: class {
    func configureView()
    func didTapBackButton()
    func didTapPassButton()
    func didTapStartButton()
    func numberOfItems() -> Int
    func itemAt(_ index: Int) -> CardViewDataModel
}

protocol StartInteractorProtocol: class {
    func numberOfItems() -> Int
    func itemAt(_ index: Int) -> WordData
}

protocol StartRouterProtocol: class {
    func back()
    func presentChoosingView()
}

protocol StartConfiguratorProtocol: class {
    func configure(with viewController: StartViewController)
}

