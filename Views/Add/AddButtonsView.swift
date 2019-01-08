//
//  AddButtonsView.swift
//  English
//
//  Created by Сергей Гаврилко on 24/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

protocol AddButtonsViewDelegate {
    func save()
    func cancel()
}

class AddButtonsView: UIView {
    
    let saveButton = AddButtonSave()
    
    let cancelButton = AddButtonCancel()
    
    var delegate: AddButtonsViewDelegate!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero)
        self.frame.size.height = 60.0
        setupViews()
    }
    
    func setupViews() {
        saveButton.isHidden = true
        saveButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(save)))
        cancelButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cancel)))
        
        addSubview(saveButton)
        addSubview(cancelButton)
        
        addConstraintsWithFormat(format: "H:[v0]-10-[v1]-\(Screen.sideInset)-|", views: saveButton, cancelButton)
        addConstraintsWithFormat(format: "V:|-10-[v0]-10-|", views: cancelButton)
        addConstraintsWithFormat(format: "V:|-10-[v0]-10-|", views: saveButton)
    }
    
    func showSaveButton() {
        saveButton.isHidden = false
    }
    
    func hideSaveButton() {
        saveButton.isHidden = true
    }

    @objc
    func save() {
        delegate.save()
    }
    
    @objc
    func cancel() {
        delegate.cancel()
    }

}
