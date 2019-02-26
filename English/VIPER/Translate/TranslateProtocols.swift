//
//  TranslateProtocols.swift
//  English
//
//  Created by Сергей Гаврилко on 25/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

protocol TranslateViewProtocol: class {
    var sourceItem: Any? { get set }
}

protocol TranslatePresenterProtocol: class {
    func configureView()
    func didTapDeleteButton()
    func didTapSoundButton()
    func didSwipeView()
}

protocol TranslateInteractorProtocol: class {
    var word: WordData { get set }
    func delete()
    func play()
}

protocol TranslateRouterProtocol: class {
    func close()
}

protocol TranslateConfiguratorProtocol: class {
    func configure(with viewController: TranslateViewController, data: WordData)
}