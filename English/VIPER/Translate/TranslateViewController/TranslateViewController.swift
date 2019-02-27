//
//  TranslateViewController.swift
//  English
//
//  Created by Сергей Гаврилко on 25/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class TranslateViewController: UIView {

    var presenter: TranslatePresenterProtocol!
    var configurator: TranslateConfiguratorProtocol = TranslateConfigurator()
    
    var sourceItem: Any? {
        didSet {
            guard let model = sourceItem as? TranslateViewDataModel else { return }
            headerLabel.text = model.original
            footerLabel.text = model.translate
            translatesView.sourceItem = (model.translates, model.translate)
        }
    }
    
    let view: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let panLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(rgb: 0xF3F3F3)
        view.layer.cornerRadius = 2
        return view
    }()
    
    let headerLabel = UILabel(font: UIFont.book(36))
    
    let footerLabel = UILabel(font: UIFont.book(24))
    
    let translatesView = TranslatesView()
    
    let soundButton = SoundButton()
    
    let buttonsContainer = UIView()
    
    let optionsButton = TranslateOptionsButton()
    
    let deleteButton = TranslateDeleteButton()
    
    var topConstraint: NSLayoutConstraint!
    
    var maxY: CGFloat = 0.0
    var currentY: CGFloat = 0.0
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(with data: WordData) {
        super.init(frame: .zero)
        configurator.configure(with: self, data: data)
        setupViews()
    }
    
    //  MARK: Methods
    
    func animateLayout(complete: (() -> ())? = nil) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.layoutIfNeeded()
        }, completion: { finished in
            if let complete = complete {
                complete()
            }
        })
    }
    
    //  MARK: Actions
    
    func viewDidAppear() {
        presenter.configureView()
        layoutIfNeeded()
        isHidden = false
        topConstraint.constant = -view.frame.height
        animateLayout()
    }
    
    func viewWillDisappear() {
        topConstraint.constant = 0
        animateLayout(complete: {
            self.removeFromSuperview()
        })
    }
    
    func didTapDeleteButton() {
        presenter.didTapDeleteButton()
    }
    
    func didTapOptionsButton() {
        optionsButton.isHidden = true
    }
    
    func didTapSoundButton() {
        presenter.didTapSoundButton()
    }
    
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        switch(gesture.state) {
        case UIGestureRecognizer.State.began:
            maxY = -view.frame.height
            currentY = topConstraint.constant
            break
        case UIGestureRecognizer.State.changed:
            let translation = gesture.translation(in: self)
            let constant = currentY + translation.y
            
            if maxY <= constant {
                topConstraint.constant = constant
            }
            layoutIfNeeded()
            break
        case UIGestureRecognizer.State.ended:
            if maxY < topConstraint.constant {
                presenter.didSwipeView()
            }
            break
        default: break
        }
    }

}

extension TranslateViewController: TranslateViewProtocol {
    
}
