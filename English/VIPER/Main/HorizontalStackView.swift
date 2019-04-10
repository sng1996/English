//
//  HorizontalStackView.swift
//  English
//
//  Created by Сергей Гаврилко on 05/04/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class HorizontalStackView: UIStackView {
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero)
        axis = .horizontal
        alignment = .fill
        distribution = .fillEqually
    }
    
}
