//
//  ChoosingProtocols.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

protocol ChoosingViewProtocol: class {
    func viewDidAppear()
    func update()
    func update(isRight: Bool, indexPath: IndexPath)
}

protocol ChoosingPresenterProtocol: class {
    var currentItem: ChoosingViewControllerDataModel { get }
    func configureView()
    func didTapBackButton()
    func didTapNextButton()
    func collectionViewDidSelectItemAt(_ indexPath: IndexPath)
    func collectionViewItemAt(_ indexPath: IndexPath) -> ChoosingCellDataModel
    func updateView()
    func updateView(isRight: Bool, index: Int)
    func finish(with mistakes: Int)
}

protocol ChoosingInteractorProtocol: class {
    var currentItem: ChoosingItem { get }
    var currentIndex: Int { get set }
    var numberOfItems: Int { get }
    func update()
    func loadNextStep()
    func didSelectItemAt(_ index: Int)
    func itemAt(_ index: Int) -> String
}

protocol ChoosingRouterProtocol: class {
    func back()
}

protocol ChoosingConfiguratorProtocol: class {
    func configure(with viewController: ChoosingViewController)
}

