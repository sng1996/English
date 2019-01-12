//
//  AddViewExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 24/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

extension AddView {
    
    func showHeaderView(_ text: String) {
        headerTextView.text = text
    }
    
    func cleanHeaderView() {
        headerTextView.text = ""
    }
    
    func showFooterView(_ text: String) {
        footerHeightConstraint.isActive = false
        footerTextView.text = text
    }
    
    func hideFooterView() {
        footerHeightConstraint.isActive = true
        footerTextView.text = ""
    }
    
    func activateHeader() {
        headerTextView.becomeFirstResponder()
    }
    
    func activateFooter() {
        footerTextView.becomeFirstResponder()
    }
    
    func deactivateTextViews() {
        headerTextView.resignFirstResponder()
        footerTextView.resignFirstResponder()
    }
    
    func hideTableView() {
        updateTableView([])
        addTableView.hide()
    }
    
    func updateTableView(_ data: [Word]) {
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
    
    func enableFooterTextView() {
        footerTextView.isUserInteractionEnabled = true
    }
    
    func disableFooterTextView() {
        footerTextView.isUserInteractionEnabled = false
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
    }
    
    func hideLoader() {
        for view in loaderContainer.subviews {
            view.removeFromSuperview()
        }
    }
    
    func hide() {
        topConstraint.isActive = false
        bottomConstraint.isActive = true
        bottomConstraint.constant = 0
        layoutIfNeeded()
        cleanHeaderView()
        hideFooterView()
        hideTableView()
        hideTranslatesView()
        hideSaveButton()
        deactivateTextViews()
        delegate.hideAddView()
    }
    
    /////////////User Actions/////////////
    
    func save() {
        vm.save(
            original: headerTextView.text,
            translate: footerTextView.text
        )
        disableFooterTextView()
        vm.cleanData()
        hide()
    }
    
    func cancel() {
        disableFooterTextView()
        vm.cleanData()
        hide()
    }
    
    func openTranslatesView() {
        showTranslatesView()
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView == headerTextView {
            headerTextViewDidChange()
        } else {
            footerTextViewDidChange()
        }
    }
    
    func headerTextViewDidChange() {
        vm.cleanData()
        hideFooterView()
        hideTableView()
        hideTranslatesView()
        hideSaveButton()
        disableFooterTextView()
        
        if headerTextView.text != "" {
            vm.translate(text: headerTextView.text)
        }
    }
    
    func footerTextViewDidChange() {
        if footerTextView.text == "" {
            hideSaveButton()
        } else {
            showSaveButton()
        }
    }
    
    func didChooseWord(_ word: Word) {
        vm.word = word
        
        showHeaderView(word.original)
        showFooterView(word.translate)
        hideTableView()
        showSaveButton()
        vm.stopLoading()
        showTranslatesView()
    }
    
    func didChooseSelfTranslate() {
        enableFooterTextView()
        showFooterView("")
        activateFooter()
        hideTableView()
        vm.stopLoading()
    }
    
    func addTranslate(_ word: Word) {
        addTableView.addData(word)
    }
    
    func changeTranslate(_ text: String) {
        showFooterView(text)
    }
    
    @objc
    func keyboardWillShow(notification: Notification) {
        if let userInfo = notification.userInfo {
            let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
            Keyboard.height = keyboardFrame.height
        }
    }
    
}
