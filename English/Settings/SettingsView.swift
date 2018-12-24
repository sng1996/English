//
//  SettingsView.swift
//  English
//
//  Created by Сергей Гаврилко on 23/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class SettingsView: UIView {

    let label = UILabel(
        text: "Settings",
        color: .gray,
        font: UIFont.medium(48),
        alignment: .center
    )
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        setupViews()
    }
    
    func viewDidAppear() {
        
    }
    
    func setupViews() {
        addSubview(label)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: label)
        addConstraintsWithFormat(format: "V:|[v0]|", views: label)
    }

}
