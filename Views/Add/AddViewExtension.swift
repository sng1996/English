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
    
    func showSaveButton() {
        buttonsView.showSaveButton()
    }
    
    func hideSaveButton() {
        buttonsView.hideSaveButton()
    }
    
    func enableFooterTextField() {
        footerTextField.isUserInteractionEnabled = true
    }
    
    func disableFooterTextField() {
        footerTextField.isUserInteractionEnabled = false
    }
    
    func showLoader() {
        hideLoader()
        
        let loader = LoaderView()
        loaderContainer.addSubview(loader)
        
        loader.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loader.centerXAnchor.constraint(equalTo: loaderContainer.centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: loaderContainer.centerYAnchor)
        ])
        
        loaderWidthConstraint.constant = 48
        layoutIfNeeded()
    }
    
    func hideLoader() {
        for view in loaderContainer.subviews {
            view.removeFromSuperview()
        }
        
        loaderWidthConstraint.constant = 0
        layoutIfNeeded()
    }
    
    func hide() {
        bottomConstraint.constant = 0
        cleanHeaderField()
        hideFooterField()
        hideTableView()
        hideTranslatesView()
        deactivateTextFields()
        delegate.hideAddView()
        canSave = false
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.topConstraint.isActive = false
            self.bottomConstraint.isActive = true
            self.layoutIfNeeded()
        }, completion: { finished in
        })
    }
    
    /////////////User Actions/////////////
    
    func save() {
        vm.save(
            original: headerTextField.text!,
            translate: footerTextField.text!
        )
        disableFooterTextField()
        vm.cleanData()
        hide()
    }
    
    @objc
    func cancel() {
        disableFooterTextField()
        vm.cleanData()
        hide()
    }
    
    func openTranslatesView() {
        showTranslatesView()
    }
    
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
    
    @objc
    func textFieldDidChange(_ textField: TextField) {
        if textField == headerTextField {
            headerTextFieldDidChange()
        } else {
            footerTextFieldDidChange()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == headerTextField {
            if canSave {
                save()
            } else {
                addTableView.chooseFirst()
            }
        }
        return false
    }
    
    func headerTextFieldDidChange() {
        vm.cleanData()
        hideFooterField()
        hideTableView()
        hideTranslatesView()
        disableFooterTextField()
        canSave = false
        
        if headerTextField.text != "" {
            vm.translate(text: headerTextField.text!)
        }
    }
    
    func footerTextFieldDidChange() {
        if footerTextField.text == "" {
            canSave = false
        } else {
            canSave = true
        }
    }
    
    func didChooseWord(_ word: Word) {
        vm.word = word
        
        showHeaderField(word.original)
        showFooterField(word.translate)
        hideTableView()
        vm.stopLoading()
        showTranslatesView()
        canSave = true
    }
    
    func didChooseSelfTranslate() {
        enableFooterTextField()
        showFooterField("")
        activateFooter()
        hideTableView()
        vm.stopLoading()
    }
    
    func addTranslate(_ word: Word) {
        addTableView.addData(word)
    }
    
    func changeTranslate(_ text: String) {
        showFooterField(text)
    }
    
    @objc
    func keyboardWillShow(notification: Notification) {
        if let userInfo = notification.userInfo {
            let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
            Keyboard.height = keyboardFrame.height
        }
    }
    
}
