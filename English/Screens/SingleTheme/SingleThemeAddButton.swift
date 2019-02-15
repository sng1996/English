//
//  SingleThemeAddButton.swift
//  English
//
//  Created by Сергей Гаврилко on 21/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class SingleThemeAddButton: Button {

    let imageView = ImageView(name: "Plus_green")
    
    let label = UILabel(
        text: "Добавлено",
        color: UIColor(rgb: 0x53D397),
        font: UIFont.medium(18),
        alignment: .center
    )
    
    let badge = Badge()
    
    var isOpen: Bool = false {
        didSet {
            if isOpen {
                open()
            }
        }
    }
    
    var widthConstraint: NSLayoutConstraint!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init() {
        super.init()
        backgroundColor = .white
        layer.cornerRadius = 3
        layer.setShadow(color: UIColor(rgb: 0x24B43F))
        setupViews()
    }
    
    func setupViews() {
        label.isHidden = true
        isHidden = true
        set(count: 0)
        
        addSubview(label)
        addSubview(imageView)
        addSubview(badge)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        badge.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 16),
            imageView.heightAnchor.constraint(equalToConstant: 16),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            heightAnchor.constraint(equalToConstant: 40),
            badge.centerXAnchor.constraint(equalTo: rightAnchor),
            badge.centerYAnchor.constraint(equalTo: topAnchor)
        ])
        
        addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: label)
        addConstraintsWithFormat(format: "V:|[v0]|", views: label)
        
        widthConstraint = widthAnchor.constraint(equalToConstant: 40)
        widthConstraint.isActive = true
    }
    
    func set(count: Int) {
        isHidden = count == 0
        badge.sourceItem = count
    }
    
    private func open() {
        imageView.isHidden = true
        badge.isHidden = true
        label.isHidden = false
        widthConstraint.constant = 150
    
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.layoutIfNeeded()
        }, completion: { finish in
            Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.close), userInfo: nil, repeats: false)
        })
    }
    
    @objc private func close() {
        isOpen = false
        imageView.isHidden = false
        badge.isHidden = false
        label.isHidden = true
        widthConstraint.constant = 40
        set(count: 0)
        layoutIfNeeded()
    }
    
}
