//
//  RepeatsTableView.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class RepeatsTableView: UITableView {
    
    var heightConstraint: NSLayoutConstraint!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero, style: .plain)
        contentInsetAdjustmentBehavior = .never
        separatorColor = .clear
        register(RepeatsCell.self, forCellReuseIdentifier: "RepeatsCell")
        backgroundColor = .clear
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = 50
        isScrollEnabled = false
    }
    
    func setInitConstraint() {
        heightConstraint = heightAnchor.constraint(equalToConstant: 500)
        heightConstraint.isActive = true
    }
    
    func updateHeightConstraint() {
        heightConstraint.constant = contentSize.height + 40
        superview!.layoutIfNeeded()
    }
    
    func activateCell(at indexPath: IndexPath) {
        deactivateCells()
        let cell = cellForRow(at: indexPath) as! RepeatsCell
        cell.isActive = true
    }
    
    func deactivateCells() {
        visibleCells.forEach {
            ($0 as! RepeatsCell).isActive = false
        }
    }
    
}
