//
//  ResultInteractor.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ResultInteractor {
    
    weak var presenter: ResultPresenterProtocol!
    
    var mistakesCount = 0
    
    required init(presenter: ResultPresenterProtocol) {
        self.presenter = presenter
    }
    
}

extension ResultInteractor: ResultInteractorProtocol {
    
}
