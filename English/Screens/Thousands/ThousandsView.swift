//
//  ThousandsView.swift
//  English
//
//  Created by Сергей Гаврилко on 24/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import KTCenterFlowLayout
import UIKit

class ThousandsView: UIView {
    
    let label = UILabel(
        text: "Thousands",
        color: .gray,
        font: UIFont.medium(48),
        alignment: .center
    )
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        setupViews()
    }
    
    func viewDidAppear() {
        ViewController.tabBarView.hideStartButton()
    }
    
    func setupViews() {
        addSubview(label)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: label)
        addConstraintsWithFormat(format: "V:|[v0]|", views: label)
    }
    
}

//class ThousandsView: UIView {
//
//    let topContainer = UIView()
//
//    let procentLabel = UILabel(
//        color: UIColor(rgb: 0xDADADA),
//        font: UIFont.medium(22)
//    )
//
//    let cv: UICollectionView = {
//        let layout = KTCenterFlowLayout()
//        layout.minimumInteritemSpacing = 15.0
//        layout.minimumLineSpacing = 15.0
//
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.register(ThousandCell.self, forCellWithReuseIdentifier: "ThousandCell")
//        collectionView.contentInset = UIEdgeInsets(
//            top: 0,
//            left: Screen.sideInset,
//            bottom: 0,
//            right: Screen.sideInset
//        )
//        collectionView.backgroundColor = .white
//        return collectionView
//    }()
//
//    let bottomContainer = UIView()
//
//    let addButton = ThousandAddButton()
//
//    let nextButton = ThousandNextButton()
//
//    let vm = ThousandsViewModel()
//
//    var cvHeight: NSLayoutConstraint!
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    init() {
//        super.init(frame: .zero)
//        self.backgroundColor = .white
//        setupViews()
//    }
//
//    func viewDidAppear() {
//        ViewController.tabBarView.hideStartButton()
//        vm.loadData()
//        cv.reloadData()
//    }
//
//    func setupViews() {
//        let differ = Screen.safeTop - ViewController.tabBarView.height
//
//        cv.delegate = self
//        cv.dataSource = self
//        addButton.isHidden = true
//        addButton.tapHandler = next
//        nextButton.tapHandler = next
//
//        addSubview(topContainer)
//        addSubview(cv)
//        addSubview(bottomContainer)
//        topContainer.addSubview(procentLabel)
//        bottomContainer.addSubview(addButton)
//        bottomContainer.addSubview(nextButton)
//
//        addConstraintsWithFormat(format: "H:|[v0]|", views: topContainer)
//        addConstraintsWithFormat(format: "H:|[v0]|", views: cv)
//        addConstraintsWithFormat(format: "H:|[v0]|", views: bottomContainer)
//        addConstraintsWithFormat(format: "V:|-\(Screen.safeTop)-[v0(70)]->=0-[v1]->=0-[v2(70)]-\(ViewController.tabBarView.height)-|", views: topContainer, cv, bottomContainer)
//
//        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]", views: procentLabel)
//        addConstraintsWithFormat(format: "H:[v0]-\(Screen.sideInset)-|", views: addButton)
//        addConstraintsWithFormat(format: "H:[v0]-\(Screen.sideInset)-|", views: nextButton)
//
//        cvHeight = cv.heightAnchor.constraint(equalToConstant: 100)
//
//        NSLayoutConstraint.activate([
//            procentLabel.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor),
//            addButton.centerYAnchor.constraint(equalTo: bottomContainer.centerYAnchor),
//            nextButton.centerYAnchor.constraint(equalTo: bottomContainer.centerYAnchor),
//            cv.centerYAnchor.constraint(equalTo: centerYAnchor, constant: differ / 2),
//            cvHeight
//        ])
//    }
//
//    func changeButton() {
//        for cell in cv.visibleCells {
//            if let cell = cell as? ThousandCell {
//                if cell.isActive {
//                    addButton.isHidden = false
//                    nextButton.isHidden = true
//                    return
//                }
//            }
//        }
//        addButton.isHidden = true
//        nextButton.isHidden = false
//    }
//
//    func next() {
//        vm.currentIndex += 1
//        cv.reloadData()
//    }
//
//}
