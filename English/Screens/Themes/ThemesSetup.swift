////
////  ThemesSetup.swift
////  English
////
////  Created by Сергей Гаврилко on 01/01/2019.
////  Copyright © 2019 gavrilko. All rights reserved.
////
//
//import UIKit
//
//extension ThemesView {
//
//    func setupViews() {
//        for theme in themesService.data {
//            let cellView = ThemesCellView()
//            cellView.delegate = self
//            cellView.sourceItem = theme
//            cellViews.append(cellView)
//        }
//        tv.dataSource = self
//        
//        addSubview(scrollView)
//        scrollView.addSubview(scrollContainer)
//        scrollContainer.addSubview(headerLabel)
//        scrollContainer.addSubview(footerLabel)
//        scrollContainer.addSubview(tv)
//        
//        addConstraintsWithFormat(format: "H:|[v0]|", views: scrollView)
//        addConstraintsWithFormat(format: "V:|[v0]|", views: scrollView)
//        
//        addConstraintsWithFormat(format: "H:|[v0(\(Screen.width))]|", views: scrollContainer)
//        addConstraintsWithFormat(format: "V:|[v0]|", views: scrollContainer)
//        
//        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: headerLabel)
//        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: footerLabel)
//        addConstraintsWithFormat(format: "H:|[v0]|", views: tv)
//        addConstraintsWithFormat(format: "V:|-\(Screen.safeTop + 40)-[v0]-3-[v1]-20-[v2]|", views: headerLabel, footerLabel, tv)
//        
//        tvHeightAnchor = tv.heightAnchor.constraint(equalToConstant: 1000)
//        tvHeightAnchor.isActive = true
//    }
//
//}
