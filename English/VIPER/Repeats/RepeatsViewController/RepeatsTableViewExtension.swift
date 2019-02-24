//
//  RepeatsTableViewExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 24/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

extension RepeatsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tv.activateCell(at: indexPath)
        scrollView.isActive = false
        presenter.tableViewDidSelectItemAt(indexPath)
    }
    
}

extension RepeatsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.tableViewNumberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepeatsCell", for: indexPath) as! RepeatsCell
        cell.sourceItem = presenter.tableViewDataForItemAt(indexPath)
        tv.updateHeightConstraint()
        return cell
    }
    
}
