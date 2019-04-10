//
//  ChoosingProtocols.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

protocol ChoosingViewProtocol: class {
    var sourceItem: Any? { get set }
    func update(isRight: Bool, indexPath: IndexPath)
    func openResultView(with model: ResultViewDataModel)
}

protocol ChoosingPresenterProtocol: class {
    var currentItem: ChoosingViewControllerDataModel { get }
    var rightIndexPath: IndexPath { get }
    func configureView()
    func didTapBackButton()
    func didFinishHideViews()
    func collectionViewDidSelectItemAt(_ indexPath: IndexPath)
    func collectionViewItemAt(_ indexPath: IndexPath) -> ChoosingCellDataModel
    func updateView()
    func updateView(isRight: Bool, index: Int)
    func finish(with mistakes: Int)
    func resultViewDidTapNext()
    func resultViewDidTapRepeat()
}

protocol ChoosingInteractorProtocol: class {
    var words: [WordData] { get set }
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
    func forward(with data: [WordData])
}

protocol ChoosingConfiguratorProtocol: class {
    func configure(with viewController: ChoosingViewController, data: [WordData])
}

