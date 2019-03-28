//
//  MusicTextFieldView.swift
//  English
//
//  Created by Сергей Гаврилко on 28/03/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

protocol MusicTextFieldViewDelegate {
    func didTapSearchButton(with text: String)
}

class MusicTextFieldView: UIView {

    let imageView = ImageView(name: "Search")
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.font = UIFont.book(18)
        textField.textColor = .black
        textField.placeholder = "Поиск"
        textField.returnKeyType = .search
        return textField
    }()
    
    var delegate: MusicTextFieldViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    func setupViews() {
        backgroundColor = UIColor(rgb: 0xF8F8F8)
        layer.cornerRadius = 5
        
        textField.delegate = self
        
        addSubview(imageView)
        addSubview(textField)
        
        addConstraintsWithFormat(format: "H:|-12-[v0(16)]-12-[v1]-12-|", views: imageView, textField)
        addConstraintsWithFormat(format: "V:|-12-[v0(16)]-12-|", views: imageView)
        textField.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

}

extension MusicTextFieldView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        delegate?.didTapSearchButton(with: textField.text!)
        return true
    }
    
}
