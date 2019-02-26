//
//  AddDelegateExtensions.swift
//  English
//
//  Created by Сергей Гаврилко on 26/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

extension AddViewController: AddButtonsViewDelegate {
    
    func didTapSaveButton(with mode: SaveButtonMode) {
        presenter.didTapButton(with: mode, header: headerTextField.text!, footer: footerTextField.text!)
    }
    
    func didTapCancelButton() {
        presenter.didTapCancelButton()
    }
    
}

extension AddViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return presenter.textFieldShouldChangeCharacters(string: string, text: textField.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let mode = buttonsView.currentMode
        presenter.didTapButton(with: mode, header: headerTextField.text!, footer: footerTextField.text!)
        return false
    }
    
}

extension AddViewController: AddTableViewDelegate {
    
    func tableViewDidSelectRowAt(_ indexPath: IndexPath) {
        presenter.tableViewDidSelectRowAt(indexPath)
    }
    
    func tableViewNumberOfRows() -> Int {
        return presenter.tableViewNumberOfRows()
    }
    
    func tableViewDataForRowAt(_ indexPath: IndexPath) -> AddCellDataModel {
        return presenter.tableViewDataForRowAt(indexPath)
    }
    
}

extension AddViewController: TranslatesViewDelegate {
    
    func didChangeTranslate(with text: String) {
        showFooterTextField(with: text)
    }
    
}
