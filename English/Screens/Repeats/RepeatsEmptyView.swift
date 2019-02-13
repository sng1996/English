//
//  RepeatsEmptyView.swift
//  English
//
//  Created by Сергей Гаврилко on 17/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class RepeatsEmptyView: UIView {

    let label = UILabel(
        text: "Список повторения пуст.\n\nСлова и фразы попадают в данный раздел сразу же после их изучения.",
        color: UIColor(rgb: 0x7F7F7F),
        font: UIFont.book(18)
    )
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setupViews()
    }
    
    func setupViews() {
        addSubview(label)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: label)
        addConstraintsWithFormat(format: "V:|[v0]|", views: label)
    }

}
