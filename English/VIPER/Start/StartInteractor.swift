//
//  StartInteractor.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class StartInteractor {
    
    weak var presenter: StartPresenterProtocol!
    
    var words: [WordData] = []
    
    required init(presenter: StartPresenterProtocol) {
        self.presenter = presenter
    }
    
}

extension StartInteractor: StartInteractorProtocol {
    
    func numberOfItems() -> Int {
        return words.count
    }
    
    func itemAt(_ index: Int) -> WordData {
        return words[index]
    }
    
}
