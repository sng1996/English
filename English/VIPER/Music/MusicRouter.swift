//
//  MusicRouter.swift
//  English
//
//  Created by Сергей Гаврилко on 27/03/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class MusicRouter {
    
    weak var viewController: MusicViewController!
    
    init(viewController: MusicViewController) {
        self.viewController = viewController
    }
    
}

extension MusicRouter: MusicRouterProtocol {

    func presentLyricsViewController(with song: Song) {
        let lyricsViewController = LyricsViewController(with: song)
        viewController.addSubview(lyricsViewController)
        viewController.addConstraintsWithFormat(format: "H:|[v0]|", views: lyricsViewController)
        viewController.addConstraintsWithFormat(format: "V:|[v0]|", views: lyricsViewController)
        //MainViewController.tabBarView.hide()
        lyricsViewController.viewDidAppear()
    }
    
}
