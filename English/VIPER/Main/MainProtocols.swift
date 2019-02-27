//
//  MainProtocols.swift
//  English
//
//  Created by Сергей Гаврилко on 25/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

protocol MainViewProtocol: class {
}

protocol MainPresenterProtocol: class {
    func didTapInboxButton()
    func didTapRepeatsButton()
    func didTapThemesButton()
    func didTapSettingsButton()
    func didTapStartButton()
}

protocol MainInteractorProtocol: class {
}

protocol MainRouterProtocol: class {
    func presentInboxViewController()
    func presentRepeatsViewController()
    func presentThemesViewController()
    func presentSettingsViewController()
    func didTapStartButton()
}

protocol MainConfiguratorProtocol: class {
    func configure(with viewController: MainViewController)
}
