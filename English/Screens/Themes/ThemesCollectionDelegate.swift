//
//  ThemesCollectionDelegate.swift
//  English
//
//  Created by Сергей Гаврилко on 01/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

extension ThemesTableCell: UICollectionViewDelegate {


}

extension ThemesTableCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThemesCollectionCell", for: indexPath) as! ThemesCollectionCell
        cell.sourceItem = array[indexPath.row]
        return cell
    }
    
}

extension ThemesTableCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = ThemesCollectionCell()
        return cell.container.frame.size
    }
    
}
