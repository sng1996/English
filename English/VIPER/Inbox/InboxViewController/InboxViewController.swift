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
    
    let addView = AddView()
    
    let translateView = TranslateView()
    
    let emptyView = InboxEmptyView()
    
    var cvHeightAnchor: NSLayoutConstraint!
    
    var coef: CGFloat {
        get {
            return addView.frame.height / (addView.frame.height - Screen.safeTop + 10)
        }
    }
    
    var blurView: BlurView? {
        didSet {
            addView.blurView = blurView
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        configurator.configure(with: self)
        setupViews()
    }
    
    //  MARK: Methods
    
    func createBlurView() {
        removeBlurView()
        
        let blurView = BlurView()
        blurView.frame = scrollView.bounds
        scrollView.addSubview(blurView)
        self.blurView = blurView
    }
    
    func removeBlurView() {
        if let blurView = blurView {
            blurView.removeFromSuperview()
            self.blurView = nil
        }
    }
    
    //  MARK: Actions
    
    func didTapStartButton() {
        
    }
    
}

extension InboxViewController: InboxViewProtocol {
    
    func viewDidAppear() {
        presenter.configureView()
    }
    
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
    
    func openTranslateView(with model: TranslateViewDataModel) {
        translateView.open(with: model)
    }
    
}

extension InboxViewController: AddViewDelegate {
    
    func didCloseAddView() {
        guard let blurView = blurView else { return }
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.scrollView.fix(at: 0)
            blurView.alpha = 0.0
        }, completion: { finished in
            self.removeBlurView()
        })
        presenter.configureView()
    }
    
}

extension InboxViewController: TranslateViewDelegate {
    
    func didCloseTranslateView() {
        scrollView.isActive = true
        presenter.configureView()
    }
    
}

