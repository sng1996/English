//
//  MusicProtocols.swift
//  English
//
//  Created by Сергей Гаврилко on 27/03/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

protocol MusicViewProtocol: class {
    func update()
}

protocol MusicPresenterProtocol: class {
    func tableViewDidSelectRowAt(_ indexPath: IndexPath)
    func tableViewNumberOfRows() -> Int
    func tableViewDataForRowAt(_ indexPath: IndexPath) -> MusicCellDataModel
    func didTapSearchButton(with text: String)
    func updateView()
}

protocol MusicInteractorProtocol: class {
    var numberOfItems: Int { get }
    func itemAt(_ index: Int) -> Song
    func search(_ text: String)
}

protocol MusicRouterProtocol: class {
    func presentLyricsViewController(with song: Song)
}

protocol MusicConfiguratorProtocol: class {
    func configure(with viewController: MusicViewController)
}

