////
////  ThemesDelegate.swift
////  English
////
////  Created by Сергей Гаврилко on 01/01/2019.
////  Copyright © 2019 gavrilko. All rights reserved.
////
//
//import UIKit
//
//extension ThemesView: ThemesCellViewDelegate { }
//extension ThemesView: NewThemeViewDelegate { }
//
//extension ThemesView: UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return cellViews.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ThemesCell", for: indexPath) as! ThemesCell
//        cell.sourceItem = cellViews[indexPath.row]
//        
//        tvHeightAnchor.constant = tv.contentSize.height + cell.frame.height + 20
//        layoutIfNeeded()
//        return cell
//    }
//    
//}
