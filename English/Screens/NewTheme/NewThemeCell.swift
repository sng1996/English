////
////  NewThemeCell.swift
////  English
////
////  Created by Сергей Гаврилко on 15/02/2019.
////  Copyright © 2019 gavrilko. All rights reserved.
////
//
//import UIKit
//
//class NewThemeCell: UITableViewCell {
//
//    var sourceItem: Any? {
//        didSet {
//            guard let item = sourceItem as? ThemeWord else { return }
//            headerLabel.text = item.data.original
//            footerLabel.text = item.data.translate
//            isActive = item.isActive
//        }
//    }
//    
//    var isActive: Bool = false {
//        didSet {
//            if isActive {
//                activate()
//            } else {
//                guard let item = sourceItem as? ThemeWord else { return }
//                item.data.isArchive ? archive() : deactivate()
//            }
//        }
//    }
//    
//    private let headerLabel = UILabel(
//        color: UIColor(rgb: 0x030303),
//        font: UIFont.medium(20)
//    )
//    
//    private let footerLabel = UILabel(
//        color: UIColor(rgb: 0xDADADA),
//        font: UIFont.book(20)
//    )
//    
//    private let checkbox = SingleThemeCheckbox()
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override init(style: UITableViewCell.CellStyle,
//                  reuseIdentifier: String?) {
//        super.init(
//            style: style,
//            reuseIdentifier: reuseIdentifier
//        )
//        selectionStyle = .none
//        setupViews()
//    }
//    
//    private func setupViews() {
//        addSubview(headerLabel)
//        addSubview(footerLabel)
//        addSubview(checkbox)
//        
//        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-[v1]-\(Screen.sideInset)-|", views: headerLabel, checkbox)
//        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-[v1]", views: footerLabel, checkbox)
//        addConstraintsWithFormat(format: "V:|-14-[v0]-2-[v1]-18-|", views: headerLabel, footerLabel)
//        
//        NSLayoutConstraint.activate([
//            checkbox.centerYAnchor.constraint(equalTo: centerYAnchor)
//            ])
//    }
//    
//    private func activate() {
//        headerLabel.textColor = UIColor(rgb: 0x53D397)
//        footerLabel.textColor = UIColor(rgb: 0xDADADA)
//        checkbox.isActive = true
//    }
//    
//    private func deactivate() {
//        headerLabel.textColor = UIColor(rgb: 0x030303)
//        checkbox.isActive = false
//    }
//    
//    private func archive() {
//        headerLabel.textColor = UIColor(rgb: 0xE1E1E1)
//        footerLabel.textColor = UIColor(rgb: 0xF5F5F5)
//        checkbox.isActive = false
//    }
//
//}
