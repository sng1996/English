//
//  TabBarStartButton.swift
//  English
//
//  Created by Сергей Гаврилко on 23/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class TabBarStartButton: Button {
    
    let view: ShadowsView = {
        let view = ShadowsView()
        view.backgroundColor = UIColor(rgb: 0x68DBA5)
        view.isUserInteractionEnabled = false
        return view
    }()
    
    let imageView = ImageView(name: "RightArrow_white")
    
    var shadows: [Shadow] {
        get {
            let shadow1 = Shadow(
                color: UIColor(rgb: 0x0F0F0F),
                offset: .zero,
                opacity: 0.01,
                radius: 0
            )
            let shadow2 = Shadow(
                color: UIColor(rgb: 0x24B43F),
                offset: CGSize(width: 0, height: 3),
                opacity: 0.1,
                radius: 6
            )
            let shadow3 = Shadow(
                color: UIColor(rgb: 0x176630),
                offset: CGSize(width: 0, height: 4),
                opacity: 0.0521,
                radius: 9
            )
            return [shadow1, shadow2, shadow3]
        }
    }
    
    let width = (Screen.width - 20) / 5
    let side: CGFloat = 40
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init() {
        super.init()
        setupViews()
    }
    
    func setupViews() {
        alpha = 0.0
        view.set(shadows: shadows)
        view.set(cornerRadius: 5)
        
        addSubview(view)
        view.addSubview(imageView)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: side),
            view.heightAnchor.constraint(equalToConstant: side),
            view.centerXAnchor.constraint(equalTo: centerXAnchor),
            view.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 11),
            imageView.heightAnchor.constraint(equalToConstant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            widthAnchor.constraint(equalToConstant: width)
        ])
    }
    
}
