//
//  ResultPresenter.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ResultPresenter {
    
    weak var view: ResultViewProtocol!
    var interactor: ResultInteractorProtocol!
    var router: ResultRouterProtocol!
    
    required init(view: ResultViewProtocol) {
        self.view = view
    }
    
    func getFooterText(_ mistakes: Int) -> String {
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

extension ResultPresenter: ResultPresenterProtocol {
    
    func configureView() {
        let mistakes = interactor.mistakes
        let headerText = "Тут надо подумать"
        let footerText = getFooterText(mistakes)
        view.sourceItem = ResultViewControllerDataModel(header: headerText, footer: footerText)
    }
    
    func didTapNextButton() {
        router.presentNext()
    }
    
    func didTapReturnButton() {
        router.repeatTask()
    }
    
}
