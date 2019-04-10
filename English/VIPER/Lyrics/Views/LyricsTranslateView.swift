//
//  LyricsTranslateView.swift
//  English
//
//  Created by Сергей Гаврилко on 29/03/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

protocol LyricsTranslateViewDelegate {
    func didChangeTranslate(with text: String)
    func didTapAddButton()
}

class LyricsTranslateView: UIView {
    
    var sourceItem: Any? {
        didSet {
            guard let word = sourceItem as? Word else { return }
            headerLabel.text = word.original
            footerLabel.text = word.translate
            translatesView.sourceItem = (word.translates, word.translate)
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

    let headerLabel = UILabel(font: UIFont.book(22))
    
    let footerLabel = UILabel(
        color: UIColor(rgb: 0x8D8D8D),
        font: UIFont.book(22)
    )
    
    let addButton = LyricsAddButton()
    
    let translatesView = TranslatesView()
    
    let soundButton = SoundButton()
    
    let speechService = SpeechService()
    
    var topConstraint: NSLayoutConstraint!
    
    var maxY: CGFloat = 0.0
    var currentY: CGFloat = 0.0
    var delegate: LyricsTranslateViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    func setupViews() {
        backgroundColor = UIColor(rgb: 0x000000, a: 0.1)
        view.layer.setShadow(offset: CGSize(width: 0, height: -3))
        
        isHidden = true
        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture)))
        translatesView.delegate = self
        soundButton.tapHandler = didTapSoundButton
        addButton.tapHandler = didTapAddButton
        
        addSubview(view)
        view.addSubview(panLine)
        view.addSubview(headerLabel)
        view.addSubview(footerLabel)
        view.addSubview(translatesView)
        view.addSubview(soundButton)
        view.addSubview(addButton)
        
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
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-[v1]", views: footerLabel, addButton)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-[v1]-\(Screen.sideInset)-|", views: translatesView, addButton)

        addConstraintsWithFormat(format: "V:|-[v0]-10-[v1]-3-[v2]-15-[v3]-\(Screen.safeBottom / 2)-|", views: panLine, headerLabel, footerLabel, translatesView)
        addConstraintsWithFormat(format: "V:[v0]-\(Screen.sideInset + Screen.safeBottom / 2)-|", views: addButton)
    }
    
    func viewDidAppear() {
        layoutIfNeeded()
        isHidden = false
        topConstraint.constant = -view.frame.height
        animateLayout()
    }
    
    func animateLayout(complete: (() -> ())? = nil) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.layoutIfNeeded()
        }, completion: { finished in
            if let complete = complete {
                complete()
            }
        })
    }
    
    func viewWillDisappear() {
        topConstraint.constant = 0
        animateLayout(complete: {
            self.removeFromSuperview()
        })
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
                viewWillDisappear()
            }
            break
        default: break
        }
    }
    
    func didTapSoundButton() {
        if let text = headerLabel.text {
            speechService.play(text)
        }
    }
    
    func didTapAddButton() {
        delegate?.didTapAddButton()
    }
    
}

extension LyricsTranslateView: TranslatesViewDelegate {
    
    func didChangeTranslate(with text: String) {
        delegate?.didChangeTranslate(with: text)
        footerLabel.text = text
    }
    
}
