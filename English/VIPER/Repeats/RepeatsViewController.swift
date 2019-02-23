//
//  RepeatsViewController.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class RepeatsViewController: UIView {
    
    var presenter: RepeatsPresenterProtocol!
    var configurator: RepeatsConfiguratorProtocol = RepeatsConfigurator()
    
    let scrollView = RepeatsScrollView()
    
    let scrollContainer = UIView()
    
    let topContainer = UIView()
    
    let label = UILabel(
        text: "Повторение",
        font: UIFont.book(36)
    )
    
    let tv = RepeatsTableView()
    
    let translateView = TranslateView()
    
    let emptyView = RepeatsEmptyView()
    
    let badge = Badge()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        configurator.configure(with: self)
        setupViews()
        viewDidAppear()
    }
    
    func setupViews() {
        translateView.delegate = self
        tv.delegate = self
        tv.dataSource = self
        
        addSubview(scrollView)
        addSubview(translateView)
        addSubview(emptyView)
        scrollView.addSubview(scrollContainer)
        scrollContainer.addSubview(topContainer)
        scrollContainer.addSubview(tv)
        topContainer.addSubview(label)
        topContainer.addSubview(badge)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: scrollView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: scrollView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: translateView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: translateView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: emptyView)
        addConstraintsWithFormat(format: "V:[v0][v1]", views: topContainer, emptyView)
        
        addConstraintsWithFormat(format: "H:|[v0(\(Screen.width))]|", views: scrollContainer)
        addConstraintsWithFormat(format: "V:|[v0]|", views: scrollContainer)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: topContainer)
        addConstraintsWithFormat(format: "H:|[v0]|", views: tv)
        addConstraintsWithFormat(format: "V:|-\(Screen.safeTop + 40)-[v0][v1]|", views: topContainer, tv)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]->=\(Screen.sideInset)-|", views: label)
        addConstraintsWithFormat(format: "V:|[v0]-20-|", views: label)
        
        badge.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            badge.leftAnchor.constraint(equalTo: label.rightAnchor),
            badge.bottomAnchor.constraint(equalTo: label.centerYAnchor)
        ])
        
        tv.setInitConstraint()
    }
    
}

extension RepeatsViewController: RepeatsViewProtocol {
    
    func viewDidAppear() {
        presenter.configureView()
    }
    
    func update() {
        tv.reloadData()
    }
    
}

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
        cell.update(with: indexPath)
        tv.updateHeightConstraint()
        return cell
    }
    
}

extension RepeatsViewController: TranslateViewDelegate {
    
    func didCloseTranslateView() {
        scrollView.isActive = true
        presenter.configureView()
    }
    
}
