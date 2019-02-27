//
//  SpellingProtocols.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

protocol SpellingViewProtocol: class {
    var sourceItem: Any? { get set }
    func hideViews()
    func updateWithRightAnswer()
    func hideKeyboard()
}

protocol SpellingPresenterProtocol: class {
    func configureView()
    func didTapBackButton()
    func textFieldDidChange(with text: String)
    func getHeader() -> String
    func getAnswer() -> String
    func didFinishHideViews()
    func updateViewWithRightAnswer()
    func updateView()
    func finish(with mistakes: Int)
    func resultViewDidTapNext()
    func resultViewDidTapRepeat()
}

protocol SpellingInteractorProtocol: class {
    var currentSpellingItem: SpellingItem { get }
    var currentIndex: Int { get set }
    var numberOfItems: Int { get }
    func update()
    func loadNextStep()
    func didChange(text: String)
    func setMistake()
}

protocol SpellingRouterProtocol: class {
    func back()
    func presentResultView(with mistakes: Int)
}

protocol SpellingConfiguratorProtocol: class {
    func configure(with viewController: SpellingViewController, data: [WordData])
}
