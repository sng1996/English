//
//  SpellingCollectionView.swift
//  English
//
//  Created by Сергей Гаврилко on 09/04/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class SpellingCollectionView: UICollectionView {

    let layout = SpellingLayout()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero, collectionViewLayout: layout)
        isScrollEnabled = false
        register(SpellingCell.self, forCellWithReuseIdentifier: "SpellingCell")
        backgroundColor = .clear
    }

}
