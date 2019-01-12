//
//  AddView.swift
//  English
//
//  Created by Сергей Гаврилко on 24/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UITextView_Placeholder
import UIKit

protocol AddViewDelegate {
    func hideAddView()
}

class AddView: UIView {
    
    let headerTextView: TextView = {
        let textView = TextView()
        textView.text = ""
        textView.placeholder = "Введите слово или фразу"
        textView.placeholderColor = UIColor(rgb: 0xCBCBCB)
        textView.font = UIFont.book(22)
        textView.textColor = .black
        textView.isScrollEnabled = false
        textView.textContainerInset = UIEdgeInsets.zero
        textView.textContainer.lineFragmentPadding = 0
        textView.autocapitalizationType = .none
        return textView
    }()
    
    let footerTextView: TextView = {
        let textView = TextView()
        textView.text = ""
        textView.font = UIFont.book(18)
        textView.textColor = .black
        textView.isScrollEnabled = false
        textView.textContainerInset = UIEdgeInsets.zero
        textView.textContainer.lineFragmentPadding = 0
        textView.autocapitalizationType = .none
        textView.keyboardLanguage = "ru"
        return textView
    }()
    
    let loaderContainer = UIView()
    
    let addTableView = AddTableView()
    
    let translatesView = TranslatesView()
    
    let buttonsView = AddButtonsView()
    
    var blurView: BlurView?
    var footerHeightConstraint: NSLayoutConstraint!
    var bottomConstraint: NSLayoutConstraint!
    var topConstraint: NSLayoutConstraint!
    var vm = AddViewModel()
    var delegate: AddViewDelegate!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        setupViews()
    }
    
    func setupViews() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        buttonsView.delegate = self
        vm.delegate = self
        headerTextView.delegate = self
        footerTextView.delegate = self
        addTableView.delegate = self
        translatesView.delegate = self
        
        headerTextView.inputAccessoryView = buttonsView
        footerTextView.inputAccessoryView = buttonsView
        
        addSubview(headerTextView)
        addSubview(footerTextView)
        addSubview(loaderContainer)
        addSubview(addTableView)
        addSubview(translatesView)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0][v1(48)]-\(Screen.sideInset - 10)-|", views: headerTextView, loaderContainer)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0][v1]", views: footerTextView, loaderContainer)
        addConstraintsWithFormat(format: "H:|[v0]|", views: addTableView)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: translatesView)
        addConstraintsWithFormat(format: "V:|-\(Screen.sideInset + Screen.safeTop)-[v0]-3-[v1]-10-[v2][v3]-\(Screen.sideInset - 13)-|", views: headerTextView, footerTextView, addTableView, translatesView)
        
        NSLayoutConstraint.activate([
            loaderContainer.heightAnchor.constraint(equalToConstant: 48),
            loaderContainer.centerYAnchor.constraint(equalTo: headerTextView.centerYAnchor)
        ])
        
        footerHeightConstraint = footerTextView.heightAnchor.constraint(equalToConstant: 0)
        footerHeightConstraint.isActive = true
    }
    
}
