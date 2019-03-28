//
//  WordsCountHintView.swift
//  English
//
//  Created by Сергей Гаврилко on 24/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

protocol WordsCountHintViewDelegate {
    func didTapButton()
}

class WordsCountHintView: UIView {

    let label = UILabel(
        text: "Оптимальное количество слов для начала обучение: 5-10",
        color: UIColor(rgb: 0x626262),
        font: UIFont.book(18),
        alignment: .center
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
    
    var delegate: WordsCountHintViewDelegate!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    func setupViews() {
        backgroundColor = UIColor(rgb: 0xFFFFFF, a: 0.8)
        
        button.tapHandler = didTapButton
        
        addSubview(container)
        container.addSubview(label)
        container.addSubview(button)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset + 10)-[v0]-\(Screen.sideInset + 10)-|", views: container)
        
        addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: label)
        addConstraintsWithFormat(format: "V:|-20-[v0]-8-[v1]-15-|", views: label, button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            container.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    func didTapButton() {
        delegate.didTapButton()
        removeFromSuperview()
    }

}
