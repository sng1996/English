//
//  RepeatsDelegate.swift
//  English
//
//  Created by Сергей Гаврилко on 28/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

extension RepeatsView: TranslateViewDelegate { }
extension RepeatsView: StartViewDelegate { }
extension RepeatsView: ChoosingViewDelegate { }
extension RepeatsView: SpellingViewDelegate { }

extension RepeatsView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let wordData = WordDataManager.instance.repeatWords[indexPath.row]
        translateView.open(wordData)
    }
    
}

extension RepeatsView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return WordDataManager.instance.repeatWords.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WordCell", for: indexPath) as! WordCell
        let word = WordDataManager.instance.repeatWords[indexPath.row]
        cell.sourceItem = word.original
        
        if indexPath.row >= WordDataManager.instance.todayCount {
            cell.setGray()
        } else {
            cell.setBlack()
        }
        
        cvHeightAnchor.constant = cv.collectionViewLayout.collectionViewContentSize.height
        layoutIfNeeded()
        return cell
    }
    
}

extension RepeatsView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = WordCell()
        let word = WordDataManager.instance.repeatWords[indexPath.row]
        cell.sourceItem = word.original
        cell.container.layoutIfNeeded()
        return cell.container.frame.size
    }
    
}
