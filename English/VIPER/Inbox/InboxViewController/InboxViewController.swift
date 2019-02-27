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
    
    let scrollView = InboxScrollView()
    
    let scrollContainer = UIView()
    
    let labelContainer = UIView()
    
    let label = UILabel(
        text: "Потяните вниз, чтобы добавить",
        color: UIColor(rgb: 0xCBCBCB),
        font: UIFont.book(20)
    )
    
    let cv = InboxCollectionView()
    
    let emptyView = InboxEmptyView()
    
    var cvHeightAnchor: NSLayoutConstraint!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        configurator.configure(with: self)
        setupViews()
    }
    
    //  MARK: Methods
    
    func createBlurView() -> BlurView {
        let blurView = BlurView()
        blurView.frame = scrollView.bounds
        scrollView.addSubview(blurView)
        return blurView
    }
    
    //  MARK: Actions
    
    func viewDidAppear() {
        presenter.configureView()
    }
    
    func didCloseTranslateView() {
        scrollView.isActive = true
        viewDidAppear()
    }
    
    func didCloseAddView() {
        viewDidAppear()
    }
    
    func didTapStartButton() {
        presenter.didTapStartButton()
    }
    
    func changeScrollViewContentOffset(value: CGFloat) {
        scrollView.contentOffset.y = value
    }
    
    func fixScrollViewContentOffset(value: CGFloat) {
        scrollView.fix(at: value)
    }
    
    func didSuccessfullyFinishStartView(with data: [WordData]) {
        presenter.didSuccessfullyFinishStartView()
    }
    
}

extension InboxViewController: InboxViewProtocol {
    
    func update() {
        cv.reloadData()
    }
    
    func showEmptyView() {
        emptyView.isHidden = false
    }
    
    func hideEmptyView() {
        emptyView.isHidden = true
    }
    
    func showStartButton() {
        ViewController.tabBarView.showStartButton()
    }
    
    func hideStartButton() {
        ViewController.tabBarView.hideStartButton()
    }
    
}

