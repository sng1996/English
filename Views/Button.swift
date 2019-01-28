//
//  Button.swift
//  English
//
//  Created by Сергей Гаврилко on 23/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class Button: UIView {
    
    var tapHandler: (() -> ())!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero)
        addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(didTap)
            )
        )
    }
    
    @objc
    func didTap() {
        if let tapHandler = tapHandler {
            tapHandler()
        }
    }

}
