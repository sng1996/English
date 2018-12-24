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
    
    var inboxView: InboxView!
    var repeatsView: RepeatsView!
    var settingsView: SettingsView!
    var thousandsView: ThousandsView!
    var themesView: ThemesView!
    var prosesView: ProsesView!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        inboxView = InboxView()
        repeatsView = RepeatsView()
        settingsView = SettingsView()
        thousandsView = ThousandsView()
        themesView = ThemesView()
        prosesView = ProsesView()
        
        setupViews()
        
        if let button = ViewController.tabBarView.buttons[0] as? TabBarButton {
            button.didTap()
        }
    }

}

