//
//  InboxScrollViewExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

extension InboxViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        presenter.scrollViewDidScroll(contentOffset: scrollView.contentOffset.y)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        presenter.scrollViewDidEndDragging(contentOffset: scrollView.contentOffset.y)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y == 0 {
            presenter.scrollViewWillBeginDragging()
        }
    }
    
}
