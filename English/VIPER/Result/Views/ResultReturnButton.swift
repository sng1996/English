//
//  ResultReturnButton.swift
//  English
//
//  Created by Сергей Гаврилко on 27/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class ResultReturnButton: Button {

    let label = UILabel(
        text: "Пройти еще раз",
        color: UIColor(rgb: 0xC8C8C8),
        font: UIFont.medium(18),
        alignment: .center
    )
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init() {
        super.init()
        self.backgroundColor = .white
        setupViews()
    }
    
    func setupViews() {
        addSubview(label)
        
        addConstraintsWithFormat(format: "H:|-15-[v0]-15-|", views: label)
        addConstraintsWithFormat(format: "V:|[v0(40)]|", views: label)
    }

}
