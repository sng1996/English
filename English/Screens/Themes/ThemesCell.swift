//
//  ThemesCell.swift
//  English
//
//  Created by Сергей Гаврилко on 01/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ThemesCell: UITableViewCell {
    
    var sourceItem: Any? {
        didSet {
            guard let item = sourceItem as? ThemesCellView else { return }
            view = item
        }
    }
    
    var view: ThemesCellView? {
        willSet {
            if let view = view {
                view.removeFromSuperview()
            }
        }
        didSet {
            if let view = view {
                self.addSubview(view)
                addConstraintsWithFormat(format: "H:|[v0]|", views: view)
                addConstraintsWithFormat(format: "V:|[v0]|", views: view)
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }

}
