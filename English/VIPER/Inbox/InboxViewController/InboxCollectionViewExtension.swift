//
//  InboxCollectionViewExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

extension InboxViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cv.activateCell(at: indexPath)
        scrollView.isActive = false
        presenter.collectionViewDidSelectItemAt(indexPath)
    }
    
}

extension InboxViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.collectionViewNumberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WordCell", for: indexPath) as! WordCell
        cell.sourceItem = presenter.collectionViewDataForItemAt(indexPath)
        cell.update(with: indexPath)
        cv.updateHeightConstraint()
        return cell
    }
    
}

extension InboxViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = WordCell()
        cell.sourceItem = presenter.collectionViewDataForItemAt(indexPath)
        return cell.size
    }
    
}
