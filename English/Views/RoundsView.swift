//
//  RoundsView.swift
//  English
//
//  Created by Сергей Гаврилко on 17/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class RoundsView: UIView {

    let round1 = RoundView()
    let round2 = RoundView()
    let round3 = RoundView()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    func setupViews() {
        addSubview(round1)
        addSubview(round2)
        addSubview(round3)
        
        addConstraintsWithFormat(format: "H:|[v0]-5-[v1]-5-[v2]|", views: round1, round2, round3)
        addConstraintsWithFormat(format: "V:|[v0]|", views: round1)
        addConstraintsWithFormat(format: "V:|[v0]|", views: round2)
        addConstraintsWithFormat(format: "V:|[v0]|", views: round3)
    }

}
