//
//  ResultView.swift
//  English
//
//  Created by Сергей Гаврилко on 27/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

enum ResultMode {
    static let choosing = ("Ознакомление пройдено", "Перейти к написанию")
    static let spelling = ("Написание пройдено", "Вернуться на главную")
}

class ResultViewDataModel {
    
    var mode: (String, String)
    var mistakes: String = ""
    
    init(_ mode: (String, String), mistakes: Int) {
        self.mode = mode
        self.mistakes = parse(mistakes)
    }
    
    func parse(_ mistakes: Int) -> String {
        switch mistakes {
        case 11, 12, 13, 14: return "Ваш результат: \(mistakes) ошибок"
        default: break
        }
        switch mistakes % 10 {
        case 0, 5, 6, 7, 8, 9: return "Ваш результат: \(mistakes) ошибок"
        case 1: return "Ваш результат: \(mistakes) ошибка"
        case 2, 3, 4: return "Ваш результат: \(mistakes) ошибки"
        default: return ""
        }
    }
    
}

class ResultView: UIView {
    
    var sourceItem: Any? {
        didSet {
            guard let model = sourceItem as? ResultViewDataModel else { return }
            headerLabel.text = model.mode.0
            footerLabel.text = model.mistakes
            nextButton.label.text = model.mode.1
        }
    }

    let imageView = ImageView(name: "Result_green")
    
    let headerLabel = UILabel(
        color: UIColor(rgb: 0x1A1A1A),
        font: UIFont.book(36),
        alignment: .center,
        scale: 0.5
    )
    
    let footerLabel = UILabel(
        color: UIColor(rgb: 0x030303),
        font: UIFont.medium(20),
        alignment: .center,
        scale: 0.5
    )
    
    let nextButton = ResultNextButton()
    
    let repeatButton = ResultRepeatButton()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    func setupViews() {
        backgroundColor = .white
        
        nextButton.tapHandler = didTapNextButton
        repeatButton.tapHandler = didTapRepeatButton
        
        addSubview(imageView)
        addSubview(headerLabel)
        addSubview(footerLabel)
        addSubview(nextButton)
        addSubview(repeatButton)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: headerLabel)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: footerLabel)
        addConstraintsWithFormat(format: "V:[v0]-35-[v1]-10-[v2]", views: imageView, headerLabel, footerLabel)
        addConstraintsWithFormat(format: "V:[v0]-15-[v1]-50-|", views: nextButton, repeatButton)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 93),
            imageView.heightAnchor.constraint(equalToConstant: 93),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            footerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nextButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            repeatButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            footerLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func viewDidAppear(with mistakes: Int) {
        if let _ = superview as? ChoosingViewController {
            sourceItem = ResultViewDataModel(ResultMode.choosing, mistakes: mistakes)
        }
        if let _ = superview as? SpellingViewController {
            sourceItem = ResultViewDataModel(ResultMode.spelling, mistakes: mistakes)
        }
    }
    
    func didTapNextButton() {
        if let choosingViewController = superview as? ChoosingViewController {
            choosingViewController.resultViewDidTapNext()
        }
        if let spellingViewController = superview as? SpellingViewController {
            spellingViewController.resultViewDidTapNext()
        }
        removeFromSuperview()
    }
    
    func didTapRepeatButton() {
        if let choosingViewController = superview as? ChoosingViewController {
            choosingViewController.resultViewDidTapRepeat()
        }
        if let spellingViewController = superview as? SpellingViewController {
            spellingViewController.resultViewDidTapRepeat()
        }
        removeFromSuperview()
        removeFromSuperview()
    }
    
}
