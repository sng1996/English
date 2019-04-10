//
//  MusicViewController.swift
//  English
//
//  Created by Сергей Гаврилко on 27/03/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import Alamofire
import PromiseKit
import StoreKit
import MediaPlayer
import UIKit

class MusicViewController: UIView {
    
    var presenter: MusicPresenterProtocol!
    var configurator: MusicConfiguratorProtocol = MusicConfigurator()
    
    let headerLabel = UILabel(
        text: "Тексты песен",
        font: UIFont.book(36)
    )
    
    let footerLabel = UILabel(
        text: "Изучайте английский, знакомясь с текстами любимых исполнителей",
        color: UIColor(rgb: 0x9B9B9B),
        font: UIFont.book(20)
    )
    
    let textFieldView = MusicTextFieldView()
    
    let tv: UITableView = {
        let tableView = UITableView()
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorColor = .white
        tableView.register(MusicCell.self, forCellReuseIdentifier: "MusicCell")
        tableView.backgroundColor = .white
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        configurator.configure(with: self)
        setupViews()
    }
    
    func setupViews() {
        backgroundColor = .white
        
        tv.delegate = self
        tv.dataSource = self
        textFieldView.delegate = self
        
        addSubview(headerLabel)
        addSubview(footerLabel)
        addSubview(textFieldView)
        addSubview(tv)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: headerLabel)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: footerLabel)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: textFieldView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: tv)
        
        addConstraintsWithFormat(format: "V:|-\(50 + Screen.safeTop)-[v0]-3-[v1]-20-[v2]-30-[v3]|", views: headerLabel, footerLabel, textFieldView, tv)
    }
    
}

extension MusicViewController: MusicViewProtocol {
    
    func update() {
        tv.reloadData()
    }
    
}

extension MusicViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.tableViewDidSelectRowAt(indexPath)
    }
    
}

extension MusicViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.tableViewNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath) as! MusicCell
        cell.sourceItem = presenter.tableViewDataForRowAt(indexPath)
        return cell
    }
    
}

extension MusicViewController: MusicTextFieldViewDelegate {
    
    func didTapSearchButton(with text: String) {
        presenter.didTapSearchButton(with: text)
    }
    
}
