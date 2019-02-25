//
//  TranslateView.swift
//  English
//
//  Created by Сергей Гаврилко on 25/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

protocol TranslateViewDelegate {
    func didCloseTranslateView()
}

class TranslateView: UIView, ServiceProvider {
    
    var sourceItem: Any? {
        didSet {
            guard let model = sourceItem as? TranslateViewDataModel else { return }
            headerLabel.text = model.original
            footerLabel.text = model.translate
            translatesView.sourceItem = model.translates
            layoutIfNeeded()
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
    
    let speechService = SpeechService()

    var topConstraint: NSLayoutConstraint!
    
    var maxY: CGFloat = 0.0
    var currentY: CGFloat = 0.0
    var delegate: TranslateViewDelegate!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero)
        isHidden = true
        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture)))
        setupViews()
    }
    
}
