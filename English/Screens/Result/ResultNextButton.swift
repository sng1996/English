//
//  ResultNextButton.swift
//  English
//
//  Created by Сергей Гаврилко on 27/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class ResultNextButton: Button {

    let label = UILabel(
        text: "Вернуться на главную",
        color: UIColor(rgb: 0x53D397),
        font: UIFont.medium(18),
        alignment: .center
    )
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init() {
        super.init()
        self.backgroundColor = .white
        self.layer.cornerRadius = 3
        self.layer.setShadow(color: UIColor(rgb: 0x53D397))
        setupViews()
    }
    
    func setupViews() {
        addSubview(label)
        
        addConstraintsWithFormat(format: "H:|-15-[v0]-15-|", views: label)
        addConstraintsWithFormat(format: "V:|[v0(40)]|", views: label)
    }

}
