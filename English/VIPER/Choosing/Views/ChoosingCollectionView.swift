//
//  ChoosingCollectionView.swift
//  English
//
//  Created by Сергей Гаврилко on 24/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

protocol ChoosingCollectionViewDelegate {
    func didFinishRightAnswerAnimation()
    func getRightIndexPath() -> IndexPath
    func showNextButton()
}

class ChoosingCollectionView: UICollectionView {
    
    var choosingDelegate: ChoosingCollectionViewDelegate!
    
    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return layout
    }()
    
    let cellSize = CGSize(
        width: Screen.width - 20,
        height: 66 * Screen.heightCoef
    )
    
    var height: CGFloat = 0
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero, collectionViewLayout: layout)
        register(ChoosingCell.self, forCellWithReuseIdentifier: "ChoosingCell")
        backgroundColor = .white
        isScrollEnabled = false
        height = 5 * 10 + 4 * cellSize.height
    }
    
    func update(isRight: Bool, indexPath: IndexPath) {
        let cell = cellForItem(at: indexPath) as! ChoosingCell
        
        if isRight {
            cell.dropShadow(color: CellColors.green)
            Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(didFinishAnimation), userInfo: nil, repeats: false)
        } else {
            cell.dropShadow(color: CellColors.red)
            cell.showContinueView()
            
            let rightIndexPath = choosingDelegate.getRightIndexPath()
            let rightCell = cellForItem(at: rightIndexPath) as! ChoosingCell
            rightCell.dropShadow(color: CellColors.green)
            choosingDelegate.showNextButton()
        }
    }
    
    @objc func didFinishAnimation() {
        choosingDelegate.didFinishRightAnswerAnimation()
    }
    
}
