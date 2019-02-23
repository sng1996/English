//
//  InboxPresenter.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class InboxPresenter {

    weak var view: InboxViewProtocol!
    var interactor: InboxInteractorProtocol!
    var router: InboxRouterProtocol!
    
    required init(view: InboxViewProtocol) {
        self.view = view
    }

}

extension InboxPresenter: InboxPresenterProtocol {
    
}
