//
//  MainPresenter.swift
//  English
//
//  Created by Сергей Гаврилко on 25/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class MainPresenter {

    weak var view: MainViewProtocol!
    var interactor: MainInteractorProtocol!
    var router: MainRouterProtocol!
    
    required init(view: MainViewProtocol) {
        self.view = view
    }

}

extension MainPresenter: MainPresenterProtocol {
    
    func didTapInboxButton() {
        router.presentInboxViewController()
    }
    
    func didTapRepeatsButton() {
        router.presentRepeatsViewController()
    }
    
    func didTapSettingsButton() {
        router.presentSettingsViewController()
    }
    
    func didTapStartButton() {
        router.didTapStartButton()
    }
    
}
