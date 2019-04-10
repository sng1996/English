//
//  MainTabBarController.swift
//  English
//
//  Created by Сергей Гаврилко on 05/04/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class MainTabBarController: UIViewController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    let container = UIView()
    
    let tabBar: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 1.0
        return view
    }()
    
    let line = Line()
    
    let stackView = HorizontalStackView()
    
    let startButtonContainer = UIView()
    
    let startButton = TabBarStartButton()
    
    var addView: AddView?
    
    var buttons: [TabBarButton] = [
        TabBarButton(item: TabBarButtonType.inbox, tag: 0),
        TabBarButton(item: TabBarButtonType.repeats, tag: 1),
        TabBarButton(item: TabBarButtonType.modules, tag: 2),
        TabBarButton(item: TabBarButtonType.settings, tag: 3),
    ]
    
    var viewControllers: [UIViewController] = [
        InboxViewController(),
        RepeatsViewController(),
        RedViewController(),
        SettingsViewController(),
    ]
    
    var currentIndex: Int = 0
    var previousIndex: Int?
    
    let height: CGFloat = 60
    let heightWithInset = 60 + Screen.sideInset / 2

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
        
        setupViews()
        buttons[0].didTap()
    }
    
    func setupViews() {
        (viewControllers[0] as! InboxViewController).delegate = self
        (viewControllers[1] as! RepeatsViewController).delegate = self
        
        for button in buttons {
            button.delegate = self
            stackView.addArrangedSubview(button)
        }
    
        startButton.tapHandler = didTapStart
        
        view.addSubview(container)
        view.addSubview(tabBar)
        
        tabBar.addSubview(stackView)
        tabBar.addSubview(startButton)
        tabBar.addSubview(line)
        
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: container)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: tabBar)
        view.addConstraintsWithFormat(format: "V:|[v0][v1(\(heightWithInset))]|", views: container, tabBar)
        
        view.addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: stackView)
        view.addConstraintsWithFormat(format: "V:|[v0(\(height))]", views: stackView)
        
        view.addConstraintsWithFormat(format: "H:[v0]-10-|", views: startButton)
        view.addConstraintsWithFormat(format: "V:|[v0(\(height))]", views: startButton)
        
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: line)
        view.addConstraintsWithFormat(format: "V:|[v0(1)]", views: line)
    }
    
    func didTapStart() {
        if let inboxVC = viewControllers[currentIndex] as? InboxViewController {
            inboxVC.didTapStartButton()
        } else if let repeatsVC = viewControllers[currentIndex] as? RepeatsViewController {
            repeatsVC.didTapStartButton()
        }
    }
    
    func showStartButton() {
        startButtonContainer.removeFromSuperview()
        stackView.addArrangedSubview(startButtonContainer)
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.view.layoutIfNeeded()
            self.startButton.alpha = 1.0
        }, completion: nil)
    }
    
    func hideStartButton() {
        startButtonContainer.removeFromSuperview()
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.view.layoutIfNeeded()
            self.startButton.alpha = 0.0
        }, completion: nil)
    }
    
    func showTabBar() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.stackView.alpha = 1.0
        }, completion: nil)
    }
    
    func hideTabBar() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.stackView.alpha = 0.0
        }, completion: nil)
    }
    
    func showBadge() {
        buttons[1].isBadgeActive = true
    }
    
    func hideBadge() {
        buttons[1].isBadgeActive = false
    }
    
    func addNewViewController() {
        addChild(viewControllers[currentIndex])
        
        container.addSubview(viewControllers[currentIndex].view)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: viewControllers[currentIndex].view)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: viewControllers[currentIndex].view)
        
        viewControllers[currentIndex].didMove(toParent: self)
    }
    
    func removePreviousViewController() {
        if let index = previousIndex {
            viewControllers[index].willMove(toParent: nil)
            viewControllers[index].view.removeFromSuperview()
            viewControllers[index].removeFromParent()
        }
    }
    
    func createBlurView() -> BlurView {
        let blurView = BlurView()
        blurView.frame = view.bounds
        view.addSubview(blurView)
        return blurView
    }
    
    func removeAddView() {
        if let view = addView {
            view.removeBlurView()
            view.removeFromSuperview()
        }
        addView = nil
    }

}

extension MainTabBarController: TabBarButtonDelegate {
    
    func didTapTabBarButton(with tag: Int) {
        buttons[currentIndex].isActive = false
        buttons[tag].isActive = true
        previousIndex = currentIndex
        currentIndex = tag
        removePreviousViewController()
        addNewViewController()
        
        if tag > 1 {
            hideStartButton()
        }
    }
    
}

extension MainTabBarController: InboxViewControllerDelegate {
    
    func inboxVCOpenTranslateView(with data: WordData) {
        if let inboxViewController = viewControllers[0] as? InboxViewController {
            let translateView = TranslateView(with: data)
            translateView.delegate = inboxViewController
            view.addSubview(translateView)
            view.addConstraintsWithFormat(format: "H:|[v0]|", views: translateView)
            view.addConstraintsWithFormat(format: "V:|[v0]|", views: translateView)
            translateView.viewDidAppear()
            hideTabBar()
        }
    }
    
    func openAddView() {
        removeAddView()
        if let inboxViewController = viewControllers[0] as? InboxViewController {
            let blurView = createBlurView()
            let addView = AddView(with: blurView)
            addView.delegate = inboxViewController
            view.addSubview(addView)
            view.addConstraintsWithFormat(format: "H:|[v0]|", views: addView)
            addView.viewDidAppear()
            self.addView = addView
        }
    }
    
    func addViewDidDragging(_ contentOffset: CGFloat) {
        if let view = addView {
            view.viewDidDragging(contentOffset)
        }
    }
    
    func addViewDidEndDragging(_ contentOffset: CGFloat) {
        if let view = addView {
            view.viewDidEndDragging(contentOffset)
        }
    }
    
}

extension MainTabBarController: RepeatsViewControllerDelegate {
    
    func repeatsVCOpenTranslateView(with data: WordData) {
        if let repeatsViewController = viewControllers[1] as? RepeatsViewController {
            let translateView = TranslateView(with: data)
            translateView.delegate = repeatsViewController
            view.addSubview(translateView)
            view.addConstraintsWithFormat(format: "H:|[v0]|", views: translateView)
            view.addConstraintsWithFormat(format: "V:|[v0]|", views: translateView)
            translateView.viewDidAppear()
            hideTabBar()
        }
    }
    
}
