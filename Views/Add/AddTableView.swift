//
//  AddTableView.swift
//  English
//
//  Created by Сергей Гаврилко on 25/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

protocol AddTableViewDelegate {
    func didChooseWord(_ word: Word?)
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
    
    var words: [Word] = []
    
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
    
    func show() {
        let y = 20.0 + (self.superview as! AddView).headerTextField.frame.height + 20.0
        
        maxHeight = Screen.height - Keyboard.height - y + 72.0
        heightConstraint.constant = maxHeight
        layoutIfNeeded()
    }
    
    func hide() {
        heightConstraint.constant = 0
        layoutIfNeeded()
    }
    
    func setData(_ words: [Word]) {
        self.words = words
        if words.count == 0 { hide() }
        reloadData()
    }
    
    func reloadData() {
        tv.reloadData()
    }
    
    func getFirst() -> Word? {
        if !words.isEmpty && heightConstraint.constant > 0 {
            return words[0]
        }
        return nil
    }
    
}

extension AddTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didChooseWord(words[indexPath.row])
    }
    
}

extension AddTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddCell", for: indexPath) as! AddCell
        cell.sourceItem = words[indexPath.row]
        
        heightConstraint.constant = min(tableView.contentSize.height + 10, maxHeight)
        layoutIfNeeded()
        return cell
    }
    
}
