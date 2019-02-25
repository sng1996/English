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
    func viewDidAppear()
    func update(isRight: Bool, rightText: String)
}

protocol SpellingPresenterProtocol: class {
    func configureView()
    func didTapBackButton()
    func didTapShowAnswer()
    func textFieldDidChange(with text: String)
    func update(isRight: Bool, rightText: String)
    func updateView()
    func finish(with mistakes: Int)
}

protocol SpellingInteractorProtocol: class {
    var currentSpellingItem: SpellingItem { get }
    func update()
    func didChange(text: String)
}

protocol SpellingRouterProtocol: class {
    func back()
    func finish()
}

protocol SpellingConfiguratorProtocol: class {
    func configure(with viewController: SpellingViewController)
}
