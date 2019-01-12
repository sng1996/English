//
//  InboxDelegate.swift
//  English
//
//  Created by Сергей Гаврилко on 24/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

extension InboxView: AddViewDelegate { }
extension InboxView: TranslateViewDelegate { }
extension InboxView: StartViewDelegate { }
extension InboxView: ChoosingViewDelegate { }
extension InboxView: SpellingViewDelegate { }

extension InboxView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let wordData = wordDataService.newWords[indexPath.row]
        translateView.open(wordData)
    }
    
}

extension InboxView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return wordDataService.newWords.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WordCell", for: indexPath) as! WordCell
        let word = wordDataService.newWords[indexPath.row]
        cell.sourceItem = word.original
        
        cvHeightAnchor.constant = cv.collectionViewLayout.collectionViewContentSize.height
        layoutIfNeeded()
        return cell
    }
    
}

extension InboxView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = WordCell()
        let word = wordDataService.newWords[indexPath.row]
        cell.sourceItem = word.original
        cell.container.layoutIfNeeded()
        return cell.container.frame.size
    }
    
}
