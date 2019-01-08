//
//  TranslateView.swift
//  English
//
//  Created by Сергей Гаврилко on 25/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

protocol TranslateViewDelegate {
    func didOpenTranslateView()
    func didCloseTranslateView()
}

class TranslateView: UIView {
    
    var sourceItem: Any? {
        didSet {
            guard let word = sourceItem as? Word else { return }
            translatesView.close()
            headerLabel.text = word.original
            footerLabel.text = word.translate
            translatesView.sourceItem = word
        }
    }
    
    let panLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(rgb: 0xF3F3F3)
        view.layer.cornerRadius = 2
        return view
    }()
    
    let headerLabel = UILabel(font: UIFont.book(36))
    
    let footerLabel = UILabel(font: UIFont.book(24))
    
    let line = Line()
    
    let translatesView = TranslatesView()
    
    let soundButton = SoundButton()
    
    let buttonsContainer = UIView()
    
    var bottomConstraint: NSLayoutConstraint!
    var topConstraint: NSLayoutConstraint!
    var height: CGFloat!
    var y: CGFloat!
    var delegate: TranslateViewDelegate!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture)))
        setupViews()
    }
    
    func setupViews() {
        soundButton.tapHandler = playSound
        
        addSubview(panLine)
        addSubview(headerLabel)
        addSubview(footerLabel)
        addSubview(line)
        addSubview(translatesView)
        addSubview(soundButton)
        addSubview(buttonsContainer)
        
        panLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            panLine.widthAnchor.constraint(equalToConstant: 30),
            panLine.heightAnchor.constraint(equalToConstant: 4),
            panLine.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0][v1]|", views: headerLabel, soundButton)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0][v1]|", views: footerLabel, soundButton)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: line)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: translatesView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: buttonsContainer)
        addConstraintsWithFormat(format: "V:|-[v0]-\(Screen.sideInset)-[v1]-3-[v2]-15-[v3(1)]-15-[v4]-10-[v5]-10-|", views: panLine, headerLabel, footerLabel, line, translatesView, buttonsContainer)
        addConstraintsWithFormat(format: "V:[v0]-[v1]", views: panLine, soundButton)
    }
    
}
