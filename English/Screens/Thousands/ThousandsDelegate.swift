//
//  ThousandsDelegate.swift
//  English
//
//  Created by Сергей Гаврилко on 07/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

//extension ThousandsView: UICollectionViewDelegate {
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath) as! ThousandCell
//        cell.isActive = !cell.isActive
//        changeButton()
//    }
//
//}
//
//extension ThousandsView: UICollectionViewDataSource {
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return vm.getNumberOfItems()
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThousandCell", for: indexPath) as! ThousandCell
//        cell.sourceItem = vm.words[vm.currentIndex][indexPath.row]
//        
//        cvHeight.constant = cv.collectionViewLayout.collectionViewContentSize.height
//        layoutIfNeeded()
//        return cell
//    }
//    
//}
//
//extension ThousandsView: UICollectionViewDelegateFlowLayout {
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cell = ThousandCell()
//        cell.sourceItem = vm.words[vm.currentIndex][indexPath.row]
//        cell.container.layoutIfNeeded()
//        return cell.container.frame.size
//    }
//    
//}
