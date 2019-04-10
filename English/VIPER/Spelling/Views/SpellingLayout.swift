//
//  SpellingLayout.swift
//  English
//
//  Created by Сергей Гаврилко on 09/04/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class SpellingLayout: UICollectionViewLayout {

    var cellPadding: CGFloat = Screen.sideInset / 4
    
    var cache: [UICollectionViewLayoutAttributes] = []
    
    var contentWidth: CGFloat = 0
    
    var contentHeight: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        let insets = collectionView.contentInset
        return collectionView.bounds.height - (insets.top + insets.bottom)
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        guard let collectionView = collectionView else { return }
        cache.removeAll()

        let sideInset = 3 * cellPadding
        let columnWidth = collectionView.bounds.width - 2 * sideInset
        var xOffset: [CGFloat] = []
        let numberOfColumns = collectionView.numberOfItems(inSection: 0)
        let topOffset: CGFloat = 0
        let bottomOffset: CGFloat = 18
        
        for column in 0 ..< numberOfColumns {
            xOffset.append(sideInset + CGFloat(column) * columnWidth)
        }
        
        for column in 0..<numberOfColumns {
            let indexPath = IndexPath(item: column, section: 0)
            let height = collectionView.bounds.height - topOffset - bottomOffset
            let frame = CGRect(x: xOffset[column], y: topOffset, width: columnWidth, height: height)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = frame
            cache.append(attributes)
            
            contentWidth = max(contentWidth, frame.maxX + sideInset)
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var visibleLayoutAttributes: [UICollectionViewLayoutAttributes] = []
        
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        return visibleLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }

}
