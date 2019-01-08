//
//  ChoosingCell.swift
//  English
//
//  Created by Сергей Гаврилко on 27/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

enum CellColors {
    static let green = UIColor(rgb: 0x53D397)
    static let red = UIColor(rgb: 0xEB6D50)
}

class ChoosingCell: UICollectionViewCell {
    
    var sourceItem: Any? {
        didSet {
            guard let text = sourceItem as? String else { return }
            label.text = text
        }
    }
    
    let label = UILabel(
        color: UIColor(rgb: 0x4A4A4A),
        font: UIFont.book(20)
    )
    
    let continueView = ChoosingContinueView()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(rgb: 0xF8F8F8).cgColor
        self.layer.cornerRadius = 3
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        self.contentView.clipsToBounds = false
        self.layer.setShadow(opacity: 0.0)
        self.backgroundColor = .white
        setupViews()
    }
    
    func setupViews() {
        addSubview(label)
        addSubview(continueView)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset - 10)-[v0]-\(Screen.sideInset - 10)-|", views: label)
        addConstraintsWithFormat(format: "V:|-3-[v0]-3-|", views: label)
        
        addConstraintsWithFormat(format: "H:[v0]|", views: continueView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: continueView)
    }
    
    func draw(color: UIColor) {
        self.layer.shadowColor = color.cgColor
        let animation = CABasicAnimation(keyPath: "shadowOpacity")
        animation.fromValue = layer.shadowOpacity
        animation.toValue = 0.1
        animation.duration = 0.2
        self.layer.add(animation, forKey: animation.keyPath)
        self.layer.shadowOpacity = 0.1
        
        UIView.transition(
            with: label,
            duration: 0.2,
            options: .transitionCrossDissolve,
            animations: {
                self.label.textColor = color
            }, completion: nil)
    }
    
    func showContinueView() {
        continueView.alpha = 1.0
    }
    
    func hideContinueView() {
        continueView.alpha = 0.0
    }
    
    func clean() {
        hideContinueView()
        label.textColor = UIColor(rgb: 0x4A4A4A)
        self.layer.shadowOpacity = 0.0
    }
    
}
