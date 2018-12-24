//
//  AddView.swift
//  English
//
//  Created by Сергей Гаврилко on 24/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class AddView: UIView {
    
    let headerTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Введите текст"
        textView.font = UIFont.book(22)
        textView.textColor = .black
        textView.isScrollEnabled = false
        textView.textContainerInset = UIEdgeInsets.zero
        textView.textContainer.lineFragmentPadding = 0
        textView.inputAccessoryView = AddButtonsView()
        return textView
    }()
    
    let footerTextView: UITextView = {
        let textView = UITextView()
        textView.text = ""
        textView.font = UIFont.book(18)
        textView.textColor = .black
        textView.isScrollEnabled = false
        textView.textContainerInset = UIEdgeInsets.zero
        textView.textContainer.lineFragmentPadding = 0
        textView.inputAccessoryView = AddButtonsView()
        return textView
    }()
    
    let openButton = OpenButton()
    
    var blurView: BlurView?
    var heightConstraint: NSLayoutConstraint!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        setupViews()
    }
    
    func setupViews() {
        headerTextView.delegate = self
        footerTextView.delegate = self
        
        addSubview(headerTextView)
        addSubview(footerTextView)
        addSubview(openButton)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0][v1]-\(Screen.sideInset - 10)-|", views: headerTextView, openButton)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0][v1]-\(Screen.sideInset - 10)-|", views: footerTextView, openButton)
        addConstraintsWithFormat(format: "V:|-\(Screen.sideInset + Screen.safeTop)-[v0][v1]-\(Screen.sideInset)-|", views: headerTextView, footerTextView)
        addConstraintsWithFormat(format: "V:[v0]-\(Screen.sideInset - 10)-|", views: openButton)
        
        heightConstraint = footerTextView.heightAnchor.constraint(equalToConstant: 0)
        heightConstraint.isActive = true
    }
    
}
