//
//  RepeatsInteractor.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class RepeatsInteractor {
    
    weak var presenter: RepeatsPresenterProtocol!
    
    required init(presenter: RepeatsPresenterProtocol) {
        self.presenter = presenter
    }
    
}

extension RepeatsInteractor: RepeatsInteractorProtocol {
    
}

