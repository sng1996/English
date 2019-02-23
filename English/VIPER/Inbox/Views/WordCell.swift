//
//  WordCell.swift
//  English
//
//  Created by Сергей Гаврилко on 24/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class WordCellDataModel {
    
    var text: String
    
    init(_ word: WordData) {
        text = word.original ?? "Пустая строка"
    }
    
}

class WordCell: UICollectionViewCell {
    
    var sourceItem: Any? {
        didSet {
            guard let model = sourceItem as? WordCellDataModel else { return }
            label.text = model.text
            container.layoutIfNeeded()
        }
    }
    
    let container = UIView()
    
    let label = UILabel(font: UIFont.book(32))
    
    var size: CGSize {
        get {
            return container.frame.size
        }
    }
    
    var isActive: Bool = true {
        didSet {
            if isActive {
                activate()
            } else {
                deactivate()
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        let maxWidth = Screen.width - 2 * Screen.sideInset - 20
        
        contentView.addSubview(container)
        container.addSubview(label)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: container)
        addConstraintsWithFormat(format: "V:|[v0]|", views: container)
        addConstraintsWithFormat(format: "H:|[v0(<=\(maxWidth))]|", views: label)
        addConstraintsWithFormat(format: "V:|[v0]|", views: label)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func update(with indexPath: IndexPath) {
        isActive = indexPath.row < 10
    }
    
    private func activate() {
        label.textColor = .black
    }
    
    private func deactivate() {
        label.textColor = UIColor(rgb: 0xDADADA)
    }

}
