//
//  ResultView.swift
//  English
//
//  Created by Сергей Гаврилко on 27/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

protocol ResultViewDelegate {
    func openNextTask()
    func repeatTask()
}

struct ResultItem {
    var isChoosing: Bool
    var mistakes: Int
}

class ResultView: UIView {
    
    var sourceItem: Any? {
        didSet {
            guard let resultItem = sourceItem as? ResultItem else { return }
            headerLabel.text = resultItem.isChoosing ? "Ознакомление пройдено" : "Написание пройдено"
            footerLabel.text = getLabelText(resultItem.mistakes)
            nextButton.label.text = resultItem.isChoosing ? "Перейти к написанию" : "Вернуться на главную"
        }
    }

    let imageView = UIImageView(image: UIImage(named: "Result_green")!)
    
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
    
    let returnButton = ResultReturnButton()
    
    var delegate: ResultViewDelegate!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        setupViews()
    }
    
    func setupViews() {
        nextButton.tapHandler = openNextTask
        returnButton.tapHandler = repeatTask
        
        addSubview(imageView)
        addSubview(headerLabel)
        addSubview(footerLabel)
        addSubview(nextButton)
        addSubview(returnButton)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: headerLabel)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: footerLabel)
        addConstraintsWithFormat(format: "V:[v0]-35-[v1]-10-[v2]", views: imageView, headerLabel, footerLabel)
        addConstraintsWithFormat(format: "V:[v0]-15-[v1]-50-|", views: nextButton, returnButton)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 93),
            imageView.heightAnchor.constraint(equalToConstant: 93),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            footerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nextButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            returnButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            footerLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func openNextTask() {
        delegate.openNextTask()
        removeFromSuperview()
    }
    
    func repeatTask() {
        delegate.repeatTask()
        removeFromSuperview()
    }
    
    func getLabelText(_ mistakes: Int) -> String {
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
