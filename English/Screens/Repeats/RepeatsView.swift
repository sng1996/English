//
//  RepeatsView.swift
//  English
//
//  Created by Сергей Гаврилко on 23/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import AlignedCollectionViewFlowLayout
import UIKit

class RepeatsView: UIView, ServiceProvider {
    
    let scrollView = ScrollView()
    
    let scrollContainer = UIView()
    
    let topContainer = UIView()
    
    let label = UILabel(
        text: "Повторение",
        font: UIFont.book(36)
    )
    
    let tv: UITableView = {
        let tableView = UITableView()
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.separatorColor = .clear
        tableView.register(RepeatsCell.self, forCellReuseIdentifier: "RepeatsCell")
        tableView.backgroundColor = .clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    let translateView = TranslateView()
    
    let emptyView = RepeatsEmptyView()
    
    let badge = Badge()
    
    var tvHeightAnchor: NSLayoutConstraint!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        setupViews()
        viewDidAppear()
    }
    
    func viewDidAppear() {
        updateScreen()
    }

}
