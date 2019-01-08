//
//  ThemesTableCell.swift
//  English
//
//  Created by Сергей Гаврилко on 01/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ThemesTableCell: UITableViewCell {
    
    var sourceItem: Any? {
        didSet {
            guard let item = sourceItem as? FirstLevelTheme else { return }
            headerLabel.text = item.header
            array = item.themes
            cv.reloadData()
        }
    }
    
    let headerLabel = UILabel(
        font:UIFont.book(24),
        lines: 1
    )
    
    let footerLabel = UILabel(
        color: UIColor(rgb: 0xCBCBCB),
        font: UIFont.medium(16),
        lines: 1
    )
    
    let cv: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 15
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ThemesCollectionCell.self, forCellWithReuseIdentifier: "ThemesCollectionCell")
        collectionView.contentInset = UIEdgeInsets(
            top: 0,
            left: Screen.sideInset,
            bottom: 0,
            right: Screen.sideInset
        )
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    let cellSize: CGSize = {
        let cell = ThemesCollectionCell()
        return cell.container.frame.size
    }()
    
    var array: [SecondLevelTheme] = []

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    func setupViews() {
        cv.delegate = self
        cv.dataSource = self
        
        addSubview(headerLabel)
        addSubview(footerLabel)
        addSubview(cv)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: headerLabel)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: footerLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: cv)
        addConstraintsWithFormat(format: "V:|[v0]-4-[v1]-27-[v2(\(cellSize.height))]|", views: headerLabel, footerLabel, cv)
        
        cv.contentSize.height = cellSize.height
    }

}
