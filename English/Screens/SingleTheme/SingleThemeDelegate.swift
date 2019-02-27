////
////  SingleThemeDelegate.swift
////  English
////
////  Created by Сергей Гаврилко on 23/01/2019.
////  Copyright © 2019 gavrilko. All rights reserved.
////
//
//import UIKit
//
//extension SingleThemeView: UITableViewDelegate {
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath) as! SingleThemeCell
//        vm.data[indexPath.row].isActive.toggle()
//        cell.isActive.toggle()
//        addButton.set(count: vm.getActiveCount())
//    }
//    
//}
//
//extension SingleThemeView: UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return vm.data.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "SingleThemeCell", for: indexPath) as! SingleThemeCell
//        cell.sourceItem = vm.data[indexPath.row]
//        
//        self.tvHeightAnchor.constant = self.tv.contentSize.height + 40
//        self.layoutIfNeeded()
//        return cell
//    }
//    
//}
//
