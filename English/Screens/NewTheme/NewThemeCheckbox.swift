////
////  NewThemeCheckbox.swift
////  English
////
////  Created by Сергей Гаврилко on 15/02/2019.
////  Copyright © 2019 gavrilko. All rights reserved.
////
//
//import UIKit
//
//class NewThemeCheckbox: UIView {
//
//    var isActive: Bool = false {
//        didSet {
//            if isActive {
//                activate()
//            } else {
//                deactivate()
//            }
//        }
//    }
//    
//    private let imageView = ImageView()
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    init() {
//        super.init(frame: .zero)
//        layer.cornerRadius = 3
//        setupViews()
//    }
//    
//    private func setupViews() {
//        addSubview(imageView)
//        
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            imageView.widthAnchor.constraint(equalToConstant: 10.5),
//            imageView.heightAnchor.constraint(equalToConstant: 10.5),
//            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -1),
//            widthAnchor.constraint(equalToConstant: 20),
//            heightAnchor.constraint(equalToConstant: 20)
//        ])
//    }
//    
//    private func activate() {
//        imageView.image = UIImage(named: "Checkbox_green")
//        layer.setShadow(color: UIColor(rgb: 0x24B43F))
//        backgroundColor = .white
//    }
//    
//    private func deactivate() {
//        imageView.image = UIImage(named: "Checkbox_gray")
//        layer.setShadow(opacity: 0)
//        backgroundColor = UIColor(rgb: 0xFBFBFB)
//    }
//
//}
