//
//  AddPresenter.swift
//  English
//
//  Created by Сергей Гаврилко on 26/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class AddPresenter {

    weak var view: AddViewProtocol!
    var interactor: AddInteractorProtocol!
    var router: AddRouterProtocol!
    
    required init(view: AddViewProtocol) {
        self.view = view
    }

}

extension AddPresenter: AddPresenterProtocol {
    
    func changeScrollViewContentOffset(value: CGFloat) {
        router.changeScrollViewContentOffset(value: value)
    }
    
    func fixScrollViewContentOffset(value: CGFloat) {
        router.fixScrollViewContentOffset(value: value)
    }
    
    func didTapBlurView() {
        router.close()
    }
    
    func textDidChange(with text: String) {
        interactor.textDidChange(with: text)
        view.update()
    }
    
    func didTapButton(with mode: SaveButtonMode, header: String, footer: String) {
        switch mode {
        case .arrow:
            interactor.didFinishFirstStep(with: header)
            break
        case .loader:
            break
        case .save:
            interactor.save(header: header, footer: footer)
            router.close()
            break
        }
    }
    
    func didTapCancelButton() {
        router.close()
    }
    
    func textFieldShouldChangeCharacters(string: String, text: String) -> Bool {
        //  Backspace pressed
        let char = string.cString(using: String.Encoding.utf8)!
        let isBackSpace = strcmp(char, "\\b")
        if isBackSpace == -92 {
            return true
        }
        
        if text.count > 50 {
            return false
        }
        
        return true
    }
    
    func tableViewDidSelectRowAt(_ indexPath: IndexPath) {
        interactor.didSelectItemAt(indexPath.row)
    }
    
    func tableViewNumberOfRows() -> Int {
        return interactor.numberOfItems
    }
    
    func tableViewDataForRowAt(_ indexPath: IndexPath) -> AddCellDataModel {
        let word = interactor.itemAt(indexPath.row)
        return AddCellDataModel(word)
    }
    
    func startLoading() {
        view.startLoading()
    }
    
    func startSecondStep() {
        if let word = interactor.word {
            view.sourceItem = AddViewDataModel(word)
        }
    }
    
    func isShowAddHint() -> Bool {
        return interactor.isShowAddHint
    }
    
    func isShowTranslateHint() -> Bool {
        return interactor.isShowTanslateHint
    }
    
}
