//
//  TranslateInteractor.swift
//  English
//
//  Created by Сергей Гаврилко on 25/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class TranslateInteractor: UIView {

    weak var presenter: TranslatePresenterProtocol!
    
    required init(presenter: TranslatePresenterProtocol) {
        self.presenter = presenter
    }
}

extension TranslateInteractor: TranslateInteractorProtocol {
}
