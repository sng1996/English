//
//  AddViewController.swift
//  English
//
//  Created by Сергей Гаврилко on 26/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class AddViewDataModel {
    
    var original: String
    var translate: String
    var translates: [Translate]
    
    init(_ word: Word) {
        original = word.original
        translate = word.translate
        translates = word.translates
    }
    
}

protocol AddViewDelegate {
    func addViewChangeScrollViewContentOffset(value: CGFloat)
    func addViewFixScrollViewContentOffset(value: CGFloat)
    func addViewDidClose()
}

class AddView: UIView {

    var presenter: AddPresenterProtocol!
    var configurator: AddConfiguratorProtocol = AddConfigurator()
    
    var sourceItem: Any? {
        didSet {
            guard let model = sourceItem as? AddViewDataModel else { return }
            headerTextField.text = model.original
            showFooterTextField(with: model.translate)
            translatesView.sourceItem = (model.translates, model.translate)
            buttonsView.currentMode = .save
            addTableView.hide()
            footerTextField.becomeFirstResponder()
        }
    }
    
    let headerTextField = AddHeaderTextField()
    
    let footerTextField = AddFooterTextField()
    
    let loaderContainer = UIView()
    
    let addTableView = AddTableView()
    
    let translatesView = TranslatesView()
    
    let buttonsView = AddButtonsView()
    
    var delegate: AddViewDelegate?
    
    var blurView: BlurView? {
        didSet {
            guard let view = blurView else { return }
            view.isUserInteractionEnabled = true
            view.container.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapBlurView)))
        }
    }
    
    var height: CGFloat {
        get {
            return frame.height
        }
    }
    
    var coef: CGFloat {
        get {
            return height / (height - Screen.safeTop + 10)
        }
    }
    
    var loaderWidthConstraint: NSLayoutConstraint!
    var footerHeightConstraint: NSLayoutConstraint!
    var bottomConstraint: NSLayoutConstraint!
    var topConstraint: NSLayoutConstraint!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(with view: BlurView) {
        super.init(frame: .zero)
        blurView = view
        configurator.configure(with: self)
        setupViews()
    }

}

extension AddView: AddViewProtocol {
    
    func update() {
        addTableView.reloadData()
    }
    
    func startLoading() {
        buttonsView.currentMode = .loader
    }
    
    func close() {
        delegate?.addViewDidClose()
        viewWillDisappear()
    }
    
}
