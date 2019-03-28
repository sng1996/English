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
}

protocol LyricsPresenterProtocol: class {
    func configureView()
    func updateView()
}

protocol LyricsInteractorProtocol: class {
    func update()
    func getSong() -> Song
}

protocol LyricsRouterProtocol: class {
    
}

protocol LyricsConfiguratorProtocol: class {
    func configure(with viewController: LyricsViewController, data: Song)
}
