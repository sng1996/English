//
//  SpellingExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 27/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UITextView_Placeholder
import UIKit

extension SpellingView {
    
    func textViewDidChange(_ textView: UITextView) {
        headerLabel.text = vm.getTranslate()
        textView.textColor = .black
        if vm.tmpCompareWords(original: textView.text) {
            rightAnswer()
        }
    }
    
    func rightAnswer() {
        speechManager.play(vm.getOriginal())
        textView.textColor = UIColor(rgb: 0x53D397)
        var delay = 0.5
        if self.vm.getOriginal().count > 10 {
            delay = Double(self.vm.getOriginal().count) / 20.0
        }
        Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(finishStep), userInfo: nil, repeats: false)
    }
    
    @objc
    func finishStep() {
        countLabel.text = vm.getCountLabelText()
        textView.becomeFirstResponder()
        hide(complete: {
            self.startNextStep()
        })
    }
    
    func startNextStep() {
        guard let item = vm.getNextSpellingItem() else {
            textView.resignFirstResponder()
            openResultView()
            vm.setRepeats()
            return
        }
        
        headerLabel.text = item.word.translate!
        textView.text = ""
        textView.placeholder = "Введите перевод"
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
        textView.placeholder = vm.getOriginal()
        textView.text = ""
        vm.errorAnswer()
    }
    
    func show() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.textView.alpha = 1.0
            self.headerLabel.alpha = 1.0
        }, completion: { finished in
        })
    }
    
    func hide(complete: @escaping () -> ()) {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.textView.alpha = 0.0
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
