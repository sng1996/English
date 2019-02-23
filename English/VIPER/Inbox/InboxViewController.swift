//
//  InboxViewController.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class InboxViewController: UIView {

    var presenter: InboxPresenterProtocol!
    var configurator: InboxConfiguratorProtocol = InboxConfigurator()
    
    let scrollView = ScrollView()
    
    let scrollContainer = UIView()
    
    let labelContainer = UIView()
    
    let label = UILabel(
        text: "Потяните вниз, чтобы добавить",
        color: UIColor(rgb: 0xCBCBCB),
        font: UIFont.book(20)
    )
    
    let cv = InboxCollectionView()
    
    let addView = AddView()
    
    let translateView = TranslateView()
    
    let emptyView = InboxEmptyView()
    
    var blurView: BlurView?
    var cvHeightAnchor: NSLayoutConstraint!
    
    var coef: CGFloat {
        get {
            return addView.frame.height / (addView.frame.height - Screen.safeTop + 10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        configurator.configure(with: self)
        setupViews()
        presenter.configureView()
    }
    
    func setupViews() {
        backgroundColor = .white
        
        addView.delegate = self
        translateView.delegate = self
        scrollView.delegate = self
        cv.delegate = self
        cv.dataSource = self
        
        addSubview(scrollView)
        addSubview(addView)
        addSubview(translateView)
        scrollView.addSubview(scrollContainer)
        scrollView.addSubview(emptyView)
        scrollContainer.addSubview(labelContainer)
        scrollContainer.addSubview(cv)
        labelContainer.addSubview(label)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: scrollView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: scrollView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: translateView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: translateView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: addView)
        addView.bottomConstraint = addView.bottomAnchor.constraint(equalTo: topAnchor, constant: 0)
        addView.topConstraint = addView.topAnchor.constraint(equalTo: topAnchor)
        addView.bottomConstraint.isActive = true
        
        addConstraintsWithFormat(format: "H:|[v0(\(Screen.width))]|", views: scrollContainer)
        addConstraintsWithFormat(format: "V:|[v0]|", views: scrollContainer)
        
        addConstraintsWithFormat(format: "H:|[v0(\(Screen.width))]", views: emptyView)
        addConstraintsWithFormat(format: "V:|[v0(\(Screen.height))]", views: emptyView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: labelContainer)
        addConstraintsWithFormat(format: "H:|[v0]|", views: cv)
        addConstraintsWithFormat(format: "V:|-\(Screen.safeTop)-[v0(70)][v1]|", views: labelContainer, cv)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]|", views: label)
        label.centerYAnchor.constraint(equalTo: labelContainer.centerYAnchor).isActive = true
        
        cv.heightConstraint = cv.heightAnchor.constraint(equalToConstant: 100)
        cv.heightConstraint.isActive = true
    }
    
}

extension InboxViewController: InboxViewProtocol {
    
    func viewDidAppear() {
        
    }
    
    
    
}

extension InboxViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
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

extension InboxViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        guard let blurView = blurView else { return }
        
        let offset = scrollView.contentOffset.y * coef
        
        addView.bottomConstraint.constant = -offset
        layoutIfNeeded()
        
        if scrollView.contentOffset.y < 0 {
            blurView.alpha = -offset / addView.frame.height
            blurView.container.alpha  = -offset / addView.frame.height
        }
        
        if offset < -addView.frame.height {
            scrollView.contentOffset.y = -addView.frame.height / coef
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if Int(scrollView.contentOffset.y * coef) == Int(-addView.frame.height) {
            fixScroll()
            addView.activateHeader()
        } else {
            if let blurView = blurView {
                blurView.alpha = 0.0
            }
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y == 0 {
            createBlurView()
        }
    }
    
    func fixScroll() {
        addView.bottomConstraint.isActive = false
        addView.topConstraint.isActive = true
        scrollView.contentOffset.y = -addView.frame.height / coef
        scrollView.contentInset.top = addView.frame.height / coef
        scrollView.isScrollEnabled = false
    }
    
    func scrollToInit() {
        scrollView.contentOffset.y = 0
        scrollView.contentInset.top = 0
        scrollView.isScrollEnabled = true
    }
    
}

