//
//  TranslatesView.swift
//  English
//
//  Created by Сергей Гаврилко on 25/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

protocol TranslatesViewDelegate {
    func didChangeTranslate(with text: String)
}

class TranslatesView: UIView {
    
    var sourceItem: Any? {
        didSet {
            guard let model = sourceItem as? ([Translate], String) else { return }
            hide()
            translates = model.0
            setupViews()
            chooseCurrentWord(translates, model.1)
        }
    }

    var views: [TranslatesItemView] = []
    var translates: [Translate] = []
    var line = Line()
    var delegate: TranslatesViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        line.isHidden = true
        addSubview(line)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: line)
        addConstraintsWithFormat(format: "V:|[v0(1)]", views: line)
    }
    
    func setupViews() {
        for translate in translates {
            let view = TranslatesItemView()
            view.sourceItem = translate
            view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(choose)))
            self.addSubview(view)
            
            if let v = views.last {
                addConstraintsWithFormat(format: "V:[v0][v1]", views: v, view)
            } else {
                addConstraintsWithFormat(format: "V:|-10-[v0]", views: view)
            }
            addConstraintsWithFormat(format: "H:|[v0]|", views: view)
            
            view.backgroundColor = .white
            views.append(view)
        }
        
        if translates.count > 0 {
            line.isHidden = false
            addConstraintsWithFormat(format: "V:[v0]-10-|", views: views.last!)
        }
    }
    
    func chooseCurrentWord(_ translates: [Translate], _ translate: String) {
        var viewIndex = 0
        var wordIndex = 0
        
        for trs in translates {
            for tr in trs.trs {
                if tr == translate {
                    views[viewIndex].chooseWord(index: wordIndex)
                    return
                }
                wordIndex += 1
            }
            wordIndex = 0
            viewIndex += 1
        }
    }
    
    @objc func choose(_ gesture: UITapGestureRecognizer) {
        guard let delegate = delegate else { return }
        
        let view = gesture.view as! TranslatesItemView
        
        if view.currentIndex < 0 {
            _ = views.map { view in
                view.clear()
            }
        }
        view.setNext()
        if let translate = view.getTranslate() {
            delegate.didChangeTranslate(with: translate)
        }
    }
    
    func clear() {
        views.forEach {
            $0.clear()
        }
    }
    
    func hide() {
        views.forEach {
            $0.removeFromSuperview()
        }
        views.removeAll()
        line.isHidden = true
    }

}
