////
////  SingleThemeTableView.swift
////  English
////
////  Created by Сергей Гаврилко on 28/01/2019.
////  Copyright © 2019 gavrilko. All rights reserved.
////
//
//import UIKit
//
//class SingleThemeTableView: UITableView {
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    init() {
//        super.init(frame: .zero, style: .plain)
//        contentInsetAdjustmentBehavior = .never
//        separatorColor = UIColor(rgb: 0xFAFAFA)
//        separatorInset = UIEdgeInsets(
//            top: 0,
//            left: Screen.sideInset,
//            bottom: 0,
//            right: Screen.sideInset
//        )
//        register(SingleThemeCell.self, forCellReuseIdentifier: "SingleThemeCell")
//        backgroundColor = .white
//        rowHeight = UITableView.automaticDimension
//        estimatedRowHeight = UITableView.automaticDimension
//        isScrollEnabled = false
//    }
//    
//}
