//
//  AddButtonsView.swift
//  English
//
//  Created by Сергей Гаврилко on 24/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class AddButtonsView: UIView {
    
    let saveButton = AddButtonSave()
    
    let cancelButton = AddButtonCancel()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero)
        self.frame.size.height = 60.0
        setupViews()
    }
    
    func setupViews() {
        addSubview(saveButton)
        addSubview(cancelButton)
        
        addConstraintsWithFormat(format: "H:[v0]-10-[v1]-20-|", views: cancelButton, saveButton)
        addConstraintsWithFormat(format: "V:|[v0]-20-|", views: cancelButton)
        addConstraintsWithFormat(format: "V:|[v0]-20-|", views: saveButton)
    }

}
