//
//  RepeatProgressBar.swift
//  English
//
//  Created by Сергей Гаврилко on 09/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class RepeatProgressBar: UIView {

    var sourceItem: Int = 0 {
        didSet {
            for round in rounds {
                round.backgroundColor = UIColor(rgb: 0xF4F4F4)
            }
            if sourceItem > 0 {
                rounds[0].backgroundColor = UIColor(rgb: 0x53D397)
            }
            if sourceItem > 1 {
                rounds[1].backgroundColor = UIColor(rgb: 0x53D397)
            }
        }
    }
    
    private let rounds: [RoundView] = [RoundView(), RoundView(), RoundView()]
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    private func setupViews() {
        for round in rounds {
            round.backgroundColor = UIColor(rgb: 0xF4F4F4)
            addSubview(round)
        }
        
        addConstraintsWithFormat(format: "H:|-10-[v0]-3-[v1]-3-[v2]-10-|", views: rounds[0], rounds[1], rounds[2])
        for round in rounds {
            addConstraintsWithFormat(format: "V:|[v0]|", views: round)
        }
    }
    
}
