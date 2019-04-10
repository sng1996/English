//
//  LyricsRouter.swift
//  English
//
//  Created by Сергей Гаврилко on 28/03/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class LyricsRouter {
    
    weak var viewController: LyricsViewController!
    
    init(viewController: LyricsViewController) {
        self.viewController = viewController
    }
    
}

extension LyricsRouter: LyricsRouterProtocol {
    
    func back() {
        viewController.viewWillDisappear()
        //MainViewController.tabBarView.show()
    }
    
}
