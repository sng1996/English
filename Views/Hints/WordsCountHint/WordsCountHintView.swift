//
//  WordsCountHintView.swift
//  English
//
//  Created by Сергей Гаврилко on 24/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class WordsCountHintView: UIView {

    let label = UILabel(
        text: "Оптимальное количество слов для начала обучение: 5-10",
        color: UIColor(rgb: 0x626262),
        font: UIFont.book(18)
    )
    
    let button = WordsCountButton()
    
    let container: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.setShadow(
            color: UIColor(rgb: 0xB4B4B4),
            offset: CGSize(width: 0, height: 13),
            opacity: 0.25,
            radius: 18
        )
        return view
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    func setupViews() {
        addSubview(container)
        container.addSubview(label)
        container.addSubview(button)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset + 10)-[v0]-\(Screen.sideInset + 10)-|", views: container)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset + 10)-[v0]-\(Screen.sideInset + 10)-|", views: container)


    }

}
