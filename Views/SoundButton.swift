//
//  SoundButton.swift
//  English
//
//  Created by Сергей Гаврилко on 25/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class SoundButton: Button {
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Sound_gray")!)
        imageView.isUserInteractionEnabled = false
        return imageView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init() {
        super.init()
        setupViews()
    }
    
    func setupViews() {
        addSubview(imageView)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0(20)]-\(Screen.sideInset)-|", views: imageView)
        addConstraintsWithFormat(format: "V:|-\(Screen.sideInset)-[v0(16)]-\(Screen.sideInset)-|", views: imageView)
    }
    
}
