//
//  AddProtocols.swift
//  English
//
//  Created by Сергей Гаврилко on 26/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

protocol AddViewProtocol: class {
    var sourceItem: Any? { get set }
    func update()
    func startLoading()
    func close()
}

protocol AddPresenterProtocol: class {
    func textDidChange(with text: String)
    func didTapButton(with mode: SaveButtonMode, header: String, footer: String)
    func textFieldShouldChangeCharacters(string: String, text: String) -> Bool
    func tableViewDidSelectRowAt(_ indexPath: IndexPath)
    func tableViewNumberOfRows() -> Int
    func tableViewDataForRowAt(_ indexPath: IndexPath) -> AddCellDataModel
    func startLoading()
    func startSecondStep()
}

protocol AddInteractorProtocol: class {
    var word: Word? { get set }
    var numberOfItems: Int { get }
    func textDidChange(with text: String)
    func didFinishFirstStep(with text: String)
    func save(header: String, footer: String)
    func didSelectItemAt(_ index: Int)
    func itemAt(_ index: Int) -> Word
}

protocol AddRouterProtocol: class {

}

protocol AddConfiguratorProtocol: class {
    func configure(with viewController: AddView)
}

