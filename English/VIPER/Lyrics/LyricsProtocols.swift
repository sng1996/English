//
//  LyricsProtocols.swift
//  English
//
//  Created by Сергей Гаврилко on 28/03/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

protocol LyricsViewProtocol: class {
    var sourceItem: Any? { get set }
    func openTranlsateView(with word: Word)
}

protocol LyricsPresenterProtocol: class {
    func configureView()
    func updateView()
    func didTapTranslateButton(with text: String)
    func didFinishTranslate(_ word: Word)
    func didChangeTranslate(with text: String)
    func didTapAddButton()
    func didTapBackButton()
}

protocol LyricsInteractorProtocol: class {
    func update()
    func getSong() -> Song
    func translate(_ text: String)
    func changeTranslate(with text: String)
    func createWord()
}

protocol LyricsRouterProtocol: class {
    func back()
}

protocol LyricsConfiguratorProtocol: class {
    func configure(with viewController: LyricsViewController, data: Song)
}
