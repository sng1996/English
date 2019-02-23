//
//  InboxInteractor.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class InboxInteractor {

    weak var presenter: InboxPresenterProtocol!
    
    required init(presenter: InboxPresenterProtocol) {
        self.presenter = presenter
    }

}

extension InboxInteractor: InboxInteractorProtocol {
    
}
