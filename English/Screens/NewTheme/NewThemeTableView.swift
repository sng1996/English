////
////  NewThemeTableView.swift
////  English
////
////  Created by Сергей Гаврилко on 15/02/2019.
////  Copyright © 2019 gavrilko. All rights reserved.
////
//
//import UIKit
//
//class NewThemeTableView: UITableView {
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
//        register(NewThemeCell.self, forCellReuseIdentifier: "NewThemeCell")
//        backgroundColor = .white
//        rowHeight = UITableView.automaticDimension
//        estimatedRowHeight = UITableView.automaticDimension
//        isScrollEnabled = false
//    }
//
//}
