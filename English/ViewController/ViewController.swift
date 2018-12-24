//
//  ViewController.swift
//  English
//
//  Created by Сергей Гаврилко on 23/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    static let tabBarView = TabBarView()
    
    let inboxView = InboxView()
    
    let repeatsView = RepeatsView()
    
    let settingsView = SettingsView()
    
    let thousandsView = ThousandsView()
    
    let themesView = ThemesView()
    
    let prosesView = ProsesView()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        if let button = ViewController.tabBarView.buttons[0] as? TabBarButton {
            button.didTap()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if Screen.safeTop >= 0 { return }
        
        if #available(iOS 11.0, *) {
            Screen.safeTop = view.safeAreaInsets.top
            Screen.safeBottom = view.safeAreaInsets.bottom
        } else {
            Screen.safeTop = topLayoutGuide.length
            Screen.safeBottom = bottomLayoutGuide.length
        }
    }

}

