//
//  SpellingProtocols.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

protocol SpellingViewProtocol: class {
    func update()
    func updateWithRed()
    func updateWithGreen()
    func insert(at indexPaths: [IndexPath])
    func scrollToNext(_ indexPath: IndexPath)
    func openResultView(with model: ResultViewDataModel)
}

protocol SpellingPresenterProtocol: class {
    func configureView()
    func collectionViewNumberOfItems() -> Int
    func collectionViewDataForItemAt(_ indexPath: IndexPath) -> SpellingCellDataModel
    func didTapBackButton()
    func didTapCheckButton(with text: String)
    func textFieldDidChange(with text: String)
    func updateViewWithGreen()
    func insertItemAt(_ index: Int)
    func scrollToNext(_ index: Int)
    func finish(with mistakes: Int)
    func getCountLabelText() -> String
    func getAnswer() -> String
    func resultViewDidTapNext()
    func resultViewDidTapRepeat()
}

protocol SpellingInteractorProtocol: class {
    var currentItem: SpellingItem { get }
    var numberOfItems: Int { get }
    var currentIndex: Int { get set }
    func update()
    func itemAt(_ index: Int) -> SpellingItem
    func next()
    func didChange(text: String)
    func setMistake()
}

protocol SpellingRouterProtocol: class {
    func back()
}

protocol SpellingConfiguratorProtocol: class {
    func configure(with viewController: SpellingViewController, data: [WordData])
}
