//
//  ResultProtocols.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

protocol ResultViewProtocol: class {
    var sourceItem: Any? { get set }
    func viewDidAppear()
}

protocol ResultPresenterProtocol: class {
    func configureView()
    func didTapNextButton()
    func didTapReturnButton()
}

protocol ResultInteractorProtocol: class {
    var mistakes: Int { get set }
}

protocol ResultRouterProtocol: class {
    func presentNext()
    func repeatTask()
}

protocol ResultConfiguratorProtocol: class {
    func configure(with viewController: ResultViewController)
}


