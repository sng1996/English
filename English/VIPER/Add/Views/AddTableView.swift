//
//  AddTableView.swift
//  English
//
//  Created by Сергей Гаврилко on 25/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

protocol AddTableViewDelegate {
    func tableViewDidSelectRowAt(_ indexPath: IndexPath)
    func tableViewNumberOfRows() -> Int
    func tableViewDataForRowAt(_ indexPath: IndexPath) -> AddCellDataModel
}

class AddTableView: UIView {

    let tv: UITableView = {
        let tableView = UITableView()
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorColor = .white
        tableView.register(AddCell.self, forCellReuseIdentifier: "AddCell")
        tableView.backgroundColor = .white
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .white
        tableView.contentInset.bottom = 58
        return tableView
    }()
    
    var heightConstraint: NSLayoutConstraint!
    var maxHeight: CGFloat = 0.0
    var delegate: AddTableViewDelegate!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    func setupViews() {
        tv.delegate = self
        tv.dataSource = self
        
        addSubview(tv)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: tv)
        addConstraintsWithFormat(format: "V:|[v0]|", views: tv)
        
        translatesAutoresizingMaskIntoConstraints = false
        heightConstraint = heightAnchor.constraint(equalToConstant: 0)
        heightConstraint.isActive = true
    }
    
    func updateConstraint() {
        heightConstraint.constant = min(tv.contentSize.height + 10, maxHeight)
        layoutIfNeeded()
    }
    
    func show() {
        let y = 20.0 + (self.superview as! AddViewController).headerTextField.frame.height + 20.0
        
        maxHeight = Screen.height - Keyboard.height - y + 72.0
        heightConstraint.constant = maxHeight
        layoutIfNeeded()
    }
    
    func hide() {
        heightConstraint.constant = 0
        layoutIfNeeded()
    }
    
    func reloadData() {
        show()
        tv.reloadData()
    }
    
}

extension AddTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.tableViewDidSelectRowAt(indexPath)
    }
    
}

extension AddTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = delegate.tableViewNumberOfRows()
        if count == 0 { hide() }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddCell", for: indexPath) as! AddCell
        cell.sourceItem = delegate.tableViewDataForRowAt(indexPath)
        updateConstraint()
        return cell
    }
    
}
