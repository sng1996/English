//
//  ChoosingView.swift
//  English
//
//  Created by Сергей Гаврилко on 27/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

protocol ChoosingViewDelegate {
    func openSpellingView(_ words: [WordData])
}

class ChoosingView: UIView {
    
    var sourceItem: Any? {
        didSet {
            guard let words = sourceItem as? [WordData] else { return }
            vm.sourceItem = words
            startNextStep()
        }
    }
    
    let topContainer = UIView()

    let backButton = BackButton()
    
    let countLabel = UILabel(
        text: "0 из 10",
        color: UIColor(rgb: 0xE7E7E7),
        font: UIFont.book(18),
        alignment: .right
    )
    
    let headerLabel = UILabel(
        color: UIColor(rgb: 0x1A1A1A),
        font: UIFont.book(36),
        alignment: .center
    )
    
    let footerLabel = UILabel(
        text: "Выбери вариант перевода:",
        color: UIColor(rgb: 0xCBCBCB),
        font: UIFont.book(20),
        alignment: .center
    )
    
    let cv: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(
            top: 10,
            left: 10,
            bottom: 10,
            right: 10
        )
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ChoosingCell.self, forCellWithReuseIdentifier: "ChoosingCell")
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    let continueView = ChoosingContinueView()
    
    let nextStepButton = UIView()
    
    let speechManager = SpeechManager()
    var vm = ChoosingViewModel()
    var delegate: ChoosingViewDelegate!
    let cellSize = CGSize(
        width: Screen.width - 20,
        height: 66 * Screen.heightCoef
    )
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        setupViews()
    }
    
}
