//
//  InboxViewController.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

protocol InboxViewControllerDelegate {
    func showTabBar()
    func showStartButton()
    func hideStartButton()
    func inboxVCOpenTranslateView(with data: WordData)
    func openAddView()
    func addViewDidDragging(_ contentOffset: CGFloat)
    func addViewDidEndDragging(_ contentOffset: CGFloat)
}

class InboxViewController: UIViewController {

    var presenter: InboxPresenterProtocol!
    var configurator: InboxConfiguratorProtocol = InboxConfigurator()
    
    var addView: AddView?
    
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
    
    var delegate: InboxViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.configureView()
    }
    
    func didCloseTranslateView() {
        scrollView.isActive = true
        presenter.configureView()
    }
    
    func didCloseAddView() {
        presenter.configureView()
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
        delegate?.showStartButton()
    }
    
    func hideStartButton() {
        delegate?.hideStartButton()
    }
    
    func openTranslateView(with data: WordData) {
        delegate?.inboxVCOpenTranslateView(with: data)
    }
    
}

extension InboxViewController: AddViewDelegate {
    
    func addViewChangeScrollViewContentOffset(value: CGFloat) {
        changeScrollViewContentOffset(value: value)
    }
    
    func addViewFixScrollViewContentOffset(value: CGFloat) {
        fixScrollViewContentOffset(value: value)
    }
    
    func addViewDidClose() {
        didCloseAddView()
    }
    
}

extension InboxViewController: TranslateViewDelegate {
    
    func translateViewDidClose() {
        delegate?.showTabBar()
        didCloseTranslateView()
    }
    
}
