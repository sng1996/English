//
//  SpellingExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 27/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

extension SpellingView {
    
    @objc
    func textFieldDidChange(_ textField: UITextField) {
        headerLabel.text = vm.getTranslate()
        textField.textColor = .black
        if vm.tmpCompareWords(original: textField.text!) {
            rightAnswer()
        }
    }
    
    func rightAnswer() {
        speechManager.play(vm.getOriginal())
        textField.textField.textColor = UIColor(rgb: 0x53D397)
        var delay = 0.5
        if self.vm.getOriginal().count > 10 {
            delay = Double(self.vm.getOriginal().count) / 20.0
        }
        Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(finishStep), userInfo: nil, repeats: false)
    }
    
    @objc
    func finishStep() {
        countLabel.text = vm.getCountLabelText()
        textField.textField.becomeFirstResponder()
        hide(complete: {
            self.startNextStep()
        })
    }
    
    func startNextStep() {
        guard let item = vm.getNextSpellingItem() else {
            textField.textField.resignFirstResponder()
            openResultView()
            vm.setRepeats()
            return
        }
        
        headerLabel.text = item.word.translate!
        textField.textField.text = ""
        show()
    }
    
    func openResultView() {
        let resultView = ResultView()
        resultView.delegate = self
        resultView.sourceItem = ResultItem(isChoosing: false, mistakes: vm.mistakes)
        self.addSubview(resultView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: resultView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: resultView)
    }
    
    func showAnswer() {
        headerLabel.text = vm.getOriginal()
        textField.textField.text = ""
        vm.errorAnswer()
    }
    
    func show() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.textField.alpha = 1.0
            self.headerLabel.alpha = 1.0
        }, completion: { finished in
        })
    }
    
    func hide(complete: @escaping () -> ()) {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.textField.alpha = 0.0
            self.headerLabel.alpha = 0.0
        }, completion: { finished in
            complete()
        })
    }
    
    func back() {
        ViewController.tabBarView.isHidden = false
        removeFromSuperview()
    }
    
    func repeatTask() {
        vm.sourceItem = vm.words
        
        finishStep()
    }
    
    func openNextTask() {
        back()
        delegate.viewDidAppear()
    }

}
