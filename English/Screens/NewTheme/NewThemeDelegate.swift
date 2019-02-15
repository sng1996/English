//
//  NewThemeDelegate.swift
//  English
//
//  Created by Сергей Гаврилко on 15/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

extension NewThemeView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! NewThemeCell
        vm.data[indexPath.row].isActive.toggle()
        cell.isActive.toggle()
        addButton.set(count: vm.getActiveCount())
    }
    
}

extension NewThemeView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewThemeCell", for: indexPath) as! NewThemeCell
        cell.sourceItem = vm.data[indexPath.row]
        
        tvHeightAnchor.constant = self.tv.contentSize.height + 40
        layoutIfNeeded()
        return cell
    }
    
}

