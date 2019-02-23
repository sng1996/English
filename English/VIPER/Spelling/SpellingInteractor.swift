//
//  SpellingInteractor.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class SpellingInteractor {
    
    weak var presenter: SpellingPresenterProtocol!
    
    required init(presenter: SpellingPresenterProtocol) {
        self.presenter = presenter
    }
    
}

extension SpellingInteractor: SpellingInteractorProtocol {
    
}
