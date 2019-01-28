//
//  ImageView.swift
//  English
//
//  Created by Сергей Гаврилко on 21/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ImageView: UIImageView {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(name: String) {
        super.init(image: UIImage(named: name))
        isUserInteractionEnabled = false
    }
    
    init() {
        super.init(image: nil)
        isUserInteractionEnabled = false
    }
    
}
