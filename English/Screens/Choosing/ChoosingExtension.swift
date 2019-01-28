//
//  ChoosingExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 27/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

extension ChoosingView {
    
    func back() {
        removeFromSuperview()
        ViewController.tabBarView.isHidden = false
    }
    
    func openNextTask() {
        delegate.openSpellingView(vm.words)
        removeFromSuperview()
    }
    
    func openResultView() {
        let resultView = ResultView()
        resultView.delegate = self
        resultView.sourceItem = ResultItem(isChoosing: true, mistakes: vm.mistakesCount)
        self.addSubview(resultView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: resultView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: resultView)
    }
    
    func repeatTask() {
        vm.sourceItem = vm.words
        
        finishStep()
    }
    
    func showNextStepButton() {
        nextStepButton.isHidden = false
    }
    
    func hideNextStepButton() {
        nextStepButton.isHidden = true
    }
    
    @objc
    func finishStep() {
        countLabel.text = vm.getCountLabelText()
        
        hide(complete: {
            self.startNextStep()
        })
    }
    
    @objc
    func startNextStep() {
        guard let chooseItem = vm.getNextChooseItem() else {
            openResultView()
            return
        }
        
        speechManager.play(chooseItem.originalWord.original!)
        headerLabel.text = chooseItem.originalWord.original
        cv.reloadData()
        show()
    }
    
    func show() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.headerLabel.alpha = 1.0
            self.footerLabel.alpha = 1.0
            self.cv.alpha = 1.0
        }, completion: nil)
    }
    
    func hide(complete: @escaping () -> ()) {
        for cell in cv.visibleCells {
            (cell as! ChoosingCell).clean()
        }
        hideNextStepButton()
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.headerLabel.alpha = 0.0
            self.footerLabel.alpha = 0.0
            self.cv.alpha = 0.0
        }, completion: { finished in
            complete()
        })
    }

    
}
