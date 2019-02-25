//
//  TranslateProtocols.swift
//  English
//
//  Created by Сергей Гаврилко on 25/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

protocol TranslateViewProtocol: class {
}

protocol TranslatePresenterProtocol: class {
}

protocol TranslateInteractorProtocol: class {
}

protocol TranslateRouterProtocol: class {
}

protocol TranslateConfiguratorProtocol: class {
    func configure(with viewController: TranslateViewController)
}
