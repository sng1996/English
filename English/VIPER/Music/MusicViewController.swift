//
//  MusicViewController.swift
//  English
//
//  Created by Сергей Гаврилко on 27/03/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import Alamofire
import PromiseKit
import StoreKit
import MediaPlayer
import UIKit

class MusicViewController: UIView {
    
    var presenter: MusicPresenterProtocol!
    var configurator: MusicConfiguratorProtocol = MusicConfigurator()
    
    let headerLabel = UILabel(
        text: "Тексты песен",
        font: UIFont.book(36)
    )
    
    let footerLabel = UILabel(
        text: "Изучайте английский, знакомясь с текстами любимых исполнителей",
        color: UIColor(rgb: 0x9B9B9B),
        font: UIFont.book(20)
    )
    
    let textFieldView = MusicTextFieldView()
    
    let tv: UITableView = {
        let tableView = UITableView()
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorColor = .white
        tableView.register(MusicCell.self, forCellReuseIdentifier: "MusicCell")
        tableView.backgroundColor = .white
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        configurator.configure(with: self)
        setupViews()
    }
    
    func setupViews() {
        backgroundColor = .white
        
        tv.delegate = self
        tv.dataSource = self
        textFieldView.delegate = self
        
        addSubview(headerLabel)
        addSubview(footerLabel)
        addSubview(textFieldView)
        addSubview(tv)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: headerLabel)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: footerLabel)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: textFieldView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: tv)
        
        addConstraintsWithFormat(format: "V:|-\(50 + Screen.safeTop)-[v0]-3-[v1]-20-[v2]-30-[v3]-\(MainViewController.tabBarView.height)-|", views: headerLabel, footerLabel, textFieldView, tv)
    }
    
}

extension MusicViewController: MusicViewProtocol {
    
    func update() {
        tv.reloadData()
    }
    
}

extension MusicViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.tableViewDidSelectRowAt(indexPath)
    }
    
}

extension MusicViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.tableViewNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath) as! MusicCell
        cell.sourceItem = presenter.tableViewDataForRowAt(indexPath)
        return cell
    }
    
}

extension MusicViewController: MusicTextFieldViewDelegate {
    
    func didTapSearchButton(with text: String) {
        presenter.didTapSearchButton(with: text)
    }
    
}





















//let systemMusicPlayer = MPMusicPlayerController.systemMusicPlayer
//let applicationMusicPlayer = MPMusicPlayerController.applicationMusicPlayer
//
//required init?(coder aDecoder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//}
//
//init() {
//    super.init(frame: .zero)
//    configurator.configure(with: self)
//    setupViews()
//
//
//    appleMusicCheckIfDeviceCanPlayback()
//    appleMusicRequestPermission()
//    appleMusicFetchStorefrontRegion()
//    appleMusicPlayTrackId(ids: ["966984970"])
//}
//
//func viewDidAppear() {
//
//}
//
//// Check if the device is capable of playback
//func appleMusicCheckIfDeviceCanPlayback() {
//    let serviceController = SKCloudServiceController()
//    serviceController.requestCapabilities { (capability: SKCloudServiceCapability, err: Error?) in
//        switch capability {
//        case []:
//            print("The user doesn't have an Apple Music subscription available. Now would be a good time to prompt them to buy one?")
//
//        case SKCloudServiceCapability.musicCatalogPlayback:
//            print("The user has an Apple Music subscription and can playback music!")
//
//        case SKCloudServiceCapability.addToCloudMusicLibrary:
//            print("The user has an Apple Music subscription, can playback music AND can add to the Cloud Music Library")
//
//        default: break
//        }
//
//    }
//}
//
//// Request permission from the user to access the Apple Music library
//func appleMusicRequestPermission() {
//    switch SKCloudServiceController.authorizationStatus() {
//    case .authorized:
//        print("The user's already authorized - we don't need to do anything more here, so we'll exit early.")
//        return
//
//    case .denied:
//        print("The user has selected 'Don't Allow' in the past - so we're going to show them a different dialog to push them through to their Settings page and change their mind, and exit the function early.")
//
//        // Show an alert to guide users into the Settings
//
//        return
//
//    case .notDetermined:
//        print("The user hasn't decided yet - so we'll break out of the switch and ask them.")
//        break
//
//    case .restricted:
//        print("User may be restricted; for example, if the device is in Education mode, it limits external Apple Music usage. This is similar behaviour to Denied.")
//        return
//
//    }
//
//    SKCloudServiceController.requestAuthorization { (status:SKCloudServiceAuthorizationStatus) in
//        switch status {
//        case .authorized:
//            print("All good - the user tapped 'OK', so you're clear to move forward and start playing.")
//
//        case .denied:
//            print("The user tapped 'Don't allow'. Read on about that below...")
//
//        case .notDetermined:
//            print("The user hasn't decided or it's not clear whether they've confirmed or denied.")
//
//        case .restricted:
//            print("User may be restricted; for example, if the device is in Education mode, it limits external Apple Music usage. This is similar behaviour to Denied.")
//
//        }
//
//    }
//}
//
//func appleMusicFetchStorefrontRegion() {
//
//    let serviceController = SKCloudServiceController()
//    serviceController.requestStorefrontIdentifier { (storefrontId:String?, err: Error?) in
//
//        guard err == nil else {
//
//            print("An error occured. Handle it here.")
//            return
//
//        }
//
//        guard let storefrontId = storefrontId, storefrontId.characters.count >= 6 else {
//
//            print("Handle the error - the callback didn't contain a valid storefrontID.")
//            return
//
//        }
//
//        print("Success! The user's storefront ID is: \(storefrontId)")
//
//    }
//
//}
//
//func appleMusicPlayTrackId(ids: [String]) {
//    applicationMusicPlayer.setQueue(with: ids)
//    applicationMusicPlayer.play()
//}
//
//
//
