//
//  RepeatsView.swift
//  English
//
//  Created by Сергей Гаврилко on 23/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import AlignedCollectionViewFlowLayout
import UIKit

class RepeatsView: UIView, ServiceProvider {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentInset.bottom = ViewController.tabBarView.height
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.alwaysBounceVertical = true
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    let scrollContainer = UIView()
    
    let topContainer = UIView()
    
    let label = UILabel(
        text: "Повторение",
        font: UIFont.book(36)
    )
    
    let archiveButton = RepeatsArchiveButton()
    
    let cv: UICollectionView = {
        let alignedFlowLayout = AlignedCollectionViewFlowLayout()
        alignedFlowLayout.horizontalAlignment = .left
        alignedFlowLayout.verticalAlignment = .top
        alignedFlowLayout.minimumInteritemSpacing = 25
        alignedFlowLayout.minimumLineSpacing = 15
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: alignedFlowLayout)
        collectionView.isScrollEnabled = false
        collectionView.register(WordCell.self, forCellWithReuseIdentifier: "WordCell")
        collectionView.contentInset = UIEdgeInsets(
            top: 0,
            left: Screen.sideInset,
            bottom: 0,
            right: Screen.sideInset
        )
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    let translateView = TranslateView()
    
    var cvHeightAnchor: NSLayoutConstraint!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        setupViews()
        viewDidAppear()
    }
    
    func viewDidAppear() {
        updateScreen()
    }

}
