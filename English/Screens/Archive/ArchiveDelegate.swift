//
//  ArchiveDelegate.swift
//  English
//
//  Created by Сергей Гаврилко on 28/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

extension ArchiveView: TranslateViewDelegate { }

extension ArchiveView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let wordData = wordDataService.archiveWords[indexPath.row]
        translateView.open(wordData)
        
        for cell in collectionView.visibleCells {
            let c = cell as! WordCell
            c.deactivate()
        }
        let cell = collectionView.cellForItem(at: indexPath) as! WordCell
        cell.activate()
    }
    
}

extension ArchiveView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return wordDataService.archiveWords.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WordCell", for: indexPath) as! WordCell
        let word = wordDataService.archiveWords[indexPath.row]
        cell.sourceItem = word.original
        
        cvHeightAnchor.constant = cv.collectionViewLayout.collectionViewContentSize.height
        layoutIfNeeded()
        return cell
    }
    
}

extension ArchiveView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = WordCell()
        let word = wordDataService.archiveWords[indexPath.row]
        cell.sourceItem = word.original
        cell.container.layoutIfNeeded()
        return cell.container.frame.size
    }
    
}
