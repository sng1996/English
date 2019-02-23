//
//  ChoosingInteractor.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ChoosingInteractor {
    
    weak var presenter: ChoosingPresenterProtocol!
    
    required init(presenter: ChoosingPresenterProtocol) {
        self.presenter = presenter
    }
    
}

extension ChoosingInteractor: ChoosingInteractorProtocol {
    
}
