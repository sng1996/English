//
//  InboxCollectionView.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import AlignedCollectionViewFlowLayout
import UIKit

class InboxCollectionView: UICollectionView {
    
    let alignedFlowLayout: AlignedCollectionViewFlowLayout = {
        let layout = AlignedCollectionViewFlowLayout()
        layout.horizontalAlignment = .left
        layout.verticalAlignment = .top
        layout.minimumInteritemSpacing = 25
        layout.minimumLineSpacing = 15
        return layout
    }()
    
    var heightConstraint: NSLayoutConstraint!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero, collectionViewLayout: alignedFlowLayout)
        isScrollEnabled = false
        register(WordCell.self, forCellWithReuseIdentifier: "WordCell")
        backgroundColor = .clear
        contentInset = UIEdgeInsets(
            top: 0,
            left: Screen.sideInset,
            bottom: 0,
            right: Screen.sideInset
        )
    }
    
    func updateHeightConstraint() {
        heightConstraint.constant = collectionViewLayout.collectionViewContentSize.height
        superview!.layoutIfNeeded()
    }
    
}
