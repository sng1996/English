//
//  ThemesTableView.swift
//  English
//
//  Created by Сергей Гаврилко on 25/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ThemesTableView: UITableView {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero, style: .plain)
        contentInsetAdjustmentBehavior = .never
        register(ThemesCell.self, forCellReuseIdentifier: "ThemesCell")
        backgroundColor = .white
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = UITableView.automaticDimension
        isScrollEnabled = false
        separatorColor = .clear
    }
    
}
