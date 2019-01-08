//
//  RepeatsArchiveButton.swift
//  English
//
//  Created by Сергей Гаврилко on 28/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class RepeatsArchiveButton: Button {

    let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Archive_black"))
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
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0(18)]-\(Screen.sideInset)-|", views: imageView)
        addConstraintsWithFormat(format: "V:|-\(Screen.sideInset)-[v0(18)]-\(Screen.sideInset)-|", views: imageView)
    }

}
