////
////  InboxHint.swift
////  English
////
////  Created by Сергей Гаврилко on 15/02/2019.
////  Copyright © 2019 gavrilko. All rights reserved.
////
//
//import UIKit
//
//class InboxHint: UIView {
//
//    let label = UILabel(
//        text: "Нажмите сюда для начала обучения",
//        color: .white,
//        font: UIFont.medium(18),
//        alignment: .center
//    )
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    init() {
//        super.init(frame: .zero)
//        backgroundColor = UIColor(rgb: 0x68DBA5)
//        layer.cornerRadius = 5
//        setupViews()
//    }
//    
//    func setupViews() {
//        addSubview(label)
//        
//        addConstraintsWithFormat(format: "H:|-10-[v0(150)]-10-|", views: label)
//        addConstraintsWithFormat(format: "V:|-5-[v0]-5-|", views: label)
//    }
//
//}
