////
////  InboxView.swift
////  English
////
////  Created by Сергей Гаврилко on 23/12/2018.
////  Copyright © 2018 gavrilko. All rights reserved.
////
//
//import DynamicBlurView
//import AlignedCollectionViewFlowLayout
//import UIKit
//
//class InboxView: UIView, ServiceProvider {
//    
//    let scrollView = ScrollView()
//    
//    let scrollContainer = UIView()
//    
//    let labelContainer = UIView()
//    
//    let label = UILabel(
//        text: "Потяните вниз, чтобы добавить",
//        color: UIColor(rgb: 0xCBCBCB),
//        font: UIFont.book(20)
//    )
//    
//    let cv: UICollectionView = {
//        let alignedFlowLayout = AlignedCollectionViewFlowLayout()
//        alignedFlowLayout.horizontalAlignment = .left
//        alignedFlowLayout.verticalAlignment = .top
//        alignedFlowLayout.minimumInteritemSpacing = 25
//        alignedFlowLayout.minimumLineSpacing = 15
//        
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: alignedFlowLayout)
//        collectionView.isScrollEnabled = false
//        collectionView.register(WordCell.self, forCellWithReuseIdentifier: "WordCell")
//        collectionView.contentInset = UIEdgeInsets(
//            top: 0,
//            left: Screen.sideInset,
//            bottom: 0,
//            right: Screen.sideInset
//        )
//        collectionView.backgroundColor = .clear
//        return collectionView
//    }()
//    
//    let addView = AddView()
//    
//    let translateView = TranslateView()
//    
//    let emptyView = InboxEmptyView()
//    
//    var blurView: BlurView?
//    var cvHeightAnchor: NSLayoutConstraint!
//    
//    var coef: CGFloat {
//        get {
//            return addView.frame.height / (addView.frame.height - Screen.safeTop + 10)
//        }
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    init() {
//        super.init(frame: .zero)
//        self.backgroundColor = .white
//        setupViews()
//        viewDidAppear()
//    }
//    
//    func viewDidAppear() {
//        updateScreen()
//    }
//    
//}
