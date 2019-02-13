//
//  AddViewExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 24/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

extension AddView {
    
    func showHeaderField(_ text: String) {
        headerTextField.text = text
    }
    
    func cleanHeaderField() {
        headerTextField.text = ""
    }
    
    func showFooterField(_ text: String) {
        footerHeightConstraint.isActive = false
        footerTextField.text = text
    }
    
    func hideFooterField() {
        footerHeightConstraint.isActive = true
        footerTextField.text = ""
    }
    
    func activateHeader() {
        headerTextField.becomeFirstResponder()
    }
    
    func activateFooter() {
        footerTextField.becomeFirstResponder()
    }
    
    func deactivateTextFields() {
        headerTextField.resignFirstResponder()
        footerTextField.resignFirstResponder()
    }
    
    func hideTableView() {
        addTableView.hide()
    }
    
    func updateTableView(_ data: [Word]) {
        addTableView.show()
        addTableView.setData(data)
    }
    
    func showTranslatesView() {
        translatesView.sourceItem = vm.word
    }
    
    func hideTranslatesView() {
        translatesView.close()
    }
    
    func hide() {
        bottomConstraint.constant = 0
        cleanHeaderField()
        hideFooterField()
        hideTableView()
        hideTranslatesView()
        deactivateTextFields()
        buttonsView.saveButton.currentMode = .arrow
        delegate.hideAddView()
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.topConstraint.isActive = false
            self.bottomConstraint.isActive = true
            self.layoutIfNeeded()
        }, completion: { finished in
        })
    }
    
    func toSecondStep(_ word: Word?) {
        buttonsView.saveButton.currentMode = .save
        
        vm.word = word
        hideTableView()
        showTranslatesView()
        activateFooter()
        
        if let word = word {
            showHeaderField(word.original)
            showFooterField(word.translate)
        }
    }
    
    func showLoader() {
        buttonsView.saveButton.currentMode = .loader
    }
    
    func startSave() {
        buttonsView.saveButton.currentMode = .save
    }
    
    /////////////User Actions/////////////
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //  Backspace pressed
        let  char = string.cString(using: String.Encoding.utf8)!
        let isBackSpace = strcmp(char, "\\b")
        if isBackSpace == -92 {
            return true
        }
        
        if textField.text!.count > 50 {
            return false
        }
        
        return true
    }
    
    @objc func textFieldDidChange(_ textField: TextField) {
        if textField == headerTextField {
            headerTextFieldDidChange()
        }
    }
    
    func headerTextFieldDidChange() {
        vm.cleanData()
        hideFooterField()
        hideTableView()
        hideTranslatesView()
        if buttonsView.saveButton.currentMode != .arrow {
            buttonsView.saveButton.currentMode = .arrow
        }
        
        if headerTextField.text != "" {
            vm.offlineTranslate(headerTextField.text!)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        didTapSaveButton()
        return false
    }
    
    func didTapSaveButton() {
        if headerTextField.text == "" { return }
        
        switch buttonsView.saveButton.currentMode {
        case .arrow:
            if let word = addTableView.getFirst() {
                if word.original == headerTextField.text!.lowercased() {
                    toSecondStep(word)
                    return
                }
            }
            vm.onlineTranslate(headerTextField.text!.lowercased())
            break
        case .loader:
            break
        case .save:
            save()
            break
        }
    }
    
    func didChooseWord(_ word: Word?) {
        toSecondStep(word)
    }
    
    func save() {
        if footerTextField.text == "" { return }
        
        vm.save(
            original: headerTextField.text!,
            translate: footerTextField.text!
        )
        vm.cleanData()
        hide()
    }
    
    @objc func didTapCancelButton() {
        vm.cleanData()
        hide()
    }
    
    func changeTranslate(_ text: String) {
        showFooterField(text)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        if let userInfo = notification.userInfo {
            let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
            Keyboard.height = keyboardFrame.height
        }
    }
    
}
