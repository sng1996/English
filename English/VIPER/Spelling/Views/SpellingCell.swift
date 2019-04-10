//
//  SpellingCell.swift
//  English
//
//  Created by Сергей Гаврилко on 09/04/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class SpellingCellDataModel {
    
    var header: String
    
    init(_ item: SpellingItem) {
        header = item.wordData.translate ?? ""
    }
    
}

protocol SpellingCellDelegate {
    func textFieldDidChange(with text: String)
    func didTapAnswerButton()
    func didTapDoneButton()
}

class SpellingCell: UICollectionViewCell {
    
    var sourceItem: Any? {
        didSet {
            guard let model = sourceItem as? SpellingCellDataModel else { return }
            headerLabel.text = model.header
            headerLabel.textColor = UIColor(rgb: 0x1A1A1A)
            textField.backgroundColor = UIColor(rgb: 0xFBFBFB)
            textField.textColor = UIColor(rgb: 0x313131)
            textField.text = ""
        }
    }
    
    let container: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 3
        view.layer.setShadow(
            color: UIColor(rgb: 0xB4B4B4),
            offset: CGSize(width: 0, height: 6),
            opacity: 0.25,
            radius: 8
        )
        return view
    }()
    
    let headerLabel = UILabel(
        color: UIColor(rgb: 0x1A1A1A),
        font: UIFont.book(32),
        scale: 0.5
    )
    
    let mockHeaderLabel = UILabel(
        color: UIColor(rgb: 0x1A1A1A),
        font: UIFont.book(32)
    )
    
    let answerButton = SpellingAnswerButton()
    
    let label = UILabel(
        text: "Введите перевод:",
        color: UIColor(rgb: 0x585858),
        font: UIFont.book(16)
    )
    
    let textField: TextField = {
        let textField = TextField()
        textField.borderStyle = .none
        textField.backgroundColor = UIColor(rgb: 0xFBFBFB)
        textField.layer.cornerRadius = 5
        textField.textColor = UIColor(rgb: 0x313131)
        textField.font = UIFont.medium(18)
        textField.keyboardLanguage = "en"
        textField.returnKeyType = .done
        textField.autocorrectionType = .no
        return textField
    }()
    
    var delegate: SpellingCellDelegate?
    
    var text: String {
        get {
            return textField.text ?? ""
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupViews()
    }
    
    func setupViews() {
        mockHeaderLabel.alpha = 0.0
        
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        textField.delegate = self
        answerButton.tapHandler = didTapAnswerButton
        
        addSubview(container)
        container.addSubview(mockHeaderLabel)
        container.addSubview(headerLabel)
        container.addSubview(answerButton)
        container.addSubview(label)
        container.addSubview(textField)
        
        let inset = Screen.sideInset * 0.75
        let containerInset = Screen.sideInset / 4
        let minHeight = 170 * Screen.heightCoef
        
        addConstraintsWithFormat(format: "H:|-\(containerInset)-[v0]-\(containerInset)-|", views: container)
        addConstraintsWithFormat(format: "V:|->=0-[v0(>=\(minHeight))]|", views: container)
        
        addConstraintsWithFormat(format: "H:|-\(inset)-[v0]-\(inset)-|", views: mockHeaderLabel)
        addConstraintsWithFormat(format: "H:|-\(inset)-[v0][v1]|", views: headerLabel, answerButton)
        addConstraintsWithFormat(format: "H:|-\(inset)-[v0]-\(inset)-|", views: label)
        addConstraintsWithFormat(format: "H:|-\(inset)-[v0]-\(inset)-|", views: textField)
        
        addConstraintsWithFormat(format: "V:|-\(inset)-[v0]", views: mockHeaderLabel)
        addConstraintsWithFormat(format: "V:|-\(inset)-[v0]->=\(inset)-[v1]-8-[v2(40)]-\(inset)-|", views: headerLabel, label, textField)
        
        answerButton.centerYAnchor.constraint(equalTo: mockHeaderLabel.centerYAnchor).isActive = true
    }
    
    @objc func textFieldDidChange() {
        setDefault()
        headerLabel.text = (sourceItem as? SpellingCellDataModel)?.header
        delegate?.textFieldDidChange(with: textField.text ?? "")
    }
    
    func setDefault() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.headerLabel.textColor = UIColor(rgb: 0x1A1A1A)
            self.textField.backgroundColor = UIColor(rgb: 0xFBFBFB)
            self.textField.textColor = UIColor(rgb: 0x313131)
        }, completion: nil)
    }
    
    func setGreen() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.headerLabel.textColor = UIColor(rgb: 0x53D397)
            self.textField.backgroundColor = UIColor(rgb: 0xE2FEF1)
            self.textField.textColor = UIColor(rgb: 0x53D397)
        }, completion: nil)
    }
    
    func setRed() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.headerLabel.textColor = UIColor(rgb: 0xF95454)
            self.textField.backgroundColor = UIColor(rgb: 0xFCEFEF)
            self.textField.textColor = UIColor(rgb: 0xF95454)
        }, completion: nil)
    }
    
    func show(_ answer: String) {
        headerLabel.textColor = UIColor(rgb: 0x1A1A1A)
        textField.backgroundColor = UIColor(rgb: 0xFBFBFB)
        textField.textColor = UIColor(rgb: 0x313131)
        textField.text = ""
        headerLabel.text = answer
    }
    
    func didTapAnswerButton() {
        delegate?.didTapAnswerButton()
    }
    
}

extension SpellingCell: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.didTapDoneButton()
        return true
    }
    
}
