//
//  SpellingAnswerButton.swift
//  English
//
//  Created by Сергей Гаврилко on 27/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class SpellingAnswerButton: Button {
    
    let imageView = ImageView(name: "Eye")
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init() {
        super.init()
        setupViews()
    }
    
    func setupViews() {
        addSubview(imageView)
        
        let inset = Screen.sideInset * 0.75
        addConstraintsWithFormat(format: "H:|-\(inset)-[v0(20)]-\(inset)-|", views: imageView)
        addConstraintsWithFormat(format: "V:|-\(inset)-[v0(13.5)]-\(inset)-|", views: imageView)
    }
    
}
