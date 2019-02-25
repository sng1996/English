//
//  TranlsateViewController.swift
//  English
//
//  Created by Сергей Гаврилко on 25/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class TranlsateViewController: UIView {

    var presenter: TranslatePresenterProtocol!
    var configurator: TranslateConfiguratorProtocol = TranslateConfigurator()
    
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
    
    init() {
        super.init(frame: .zero)
        configurator.configure(with: self)
        setupViews()
    }
    
    func setupViews() {
        isHidden = true
        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture)))
        
        deleteButton.tapHandler = didTapDeleteButton
        optionsButton.tapHandler = didTapOptionsButton
        soundButton.tapHandler = didTapSoundButton
        
        addSubview(view)
        view.addSubview(panLine)
        view.addSubview(headerLabel)
        view.addSubview(footerLabel)
        view.addSubview(translatesView)
        view.addSubview(soundButton)
        view.addSubview(buttonsContainer)
        buttonsContainer.addSubview(deleteButton)
        buttonsContainer.addSubview(optionsButton)
        
        topConstraint = view.topAnchor.constraint(equalTo: bottomAnchor)
        
        panLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            panLine.widthAnchor.constraint(equalToConstant: 30),
            panLine.heightAnchor.constraint(equalToConstant: 4),
            panLine.centerXAnchor.constraint(equalTo: centerXAnchor),
            soundButton.topAnchor.constraint(equalTo: headerLabel.topAnchor, constant: -10),
            topConstraint
        ])
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: view)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0][v1]|", views: headerLabel, soundButton)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0][v1]|", views: footerLabel, soundButton)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: translatesView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: buttonsContainer)
        addConstraintsWithFormat(format: "V:|-[v0]-10-[v1]-3-[v2]-15-[v3][v4]-\(Screen.safeBottom / 2)-|", views: panLine, headerLabel, footerLabel, translatesView, buttonsContainer)
        addConstraintsWithFormat(format: "H:|[v0]|", views: deleteButton)
        addConstraintsWithFormat(format: "V:|[v0]|", views: deleteButton)
        addConstraintsWithFormat(format: "H:|[v0]|", views: optionsButton)
        addConstraintsWithFormat(format: "V:|[v0]|", views: optionsButton)
    }
    
    //  MARK: Actions
    
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
