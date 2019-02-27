////
////  MusicView.swift
////  English
////
////  Created by Сергей Гаврилко on 28/01/2019.
////  Copyright © 2019 gavrilko. All rights reserved.
////
//
//import StoreKit
//import MediaPlayer
//import UIKit
//
//class MusicView: UIView {
//    
//    let systemMusicPlayer = MPMusicPlayerController.systemMusicPlayer
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    init() {
//        super.init(frame: .zero)
//        appleMusicCheckIfDeviceCanPlayback()
//        appleMusicRequestPermission()
//        appleMusicFetchStorefrontRegion()
//        appleMusicPlayTrackId(ids: ["966984970"])
//    }
//    
//    func viewDidAppear() {
//        
//    }
//    
//    // Check if the device is capable of playback
//    func appleMusicCheckIfDeviceCanPlayback() {
//        let serviceController = SKCloudServiceController()
//        serviceController.requestCapabilities { (capability:SKCloudServiceCapability, err: Error?) in
//            
//            switch capability {
//            case []:
//                print("The user doesn't have an Apple Music subscription available. Now would be a good time to prompt them to buy one?")
//                
//            case SKCloudServiceCapability.musicCatalogPlayback:
//                print("The user has an Apple Music subscription and can playback music!")
//                
//            case SKCloudServiceCapability.addToCloudMusicLibrary:
//                print("The user has an Apple Music subscription, can playback music AND can add to the Cloud Music Library")
//                
//            default: break
//            }
//            
//        }
//    }
//    
//    // Request permission from the user to access the Apple Music library
//    func appleMusicRequestPermission() {
//        switch SKCloudServiceController.authorizationStatus() {
//        case .authorized:
//            print("The user's already authorized - we don't need to do anything more here, so we'll exit early.")
//            return
//            
//        case .denied:
//            print("The user has selected 'Don't Allow' in the past - so we're going to show them a different dialog to push them through to their Settings page and change their mind, and exit the function early.")
//            
//            // Show an alert to guide users into the Settings
//            
//            return
//            
//        case .notDetermined:
//            print("The user hasn't decided yet - so we'll break out of the switch and ask them.")
//            break
//            
//        case .restricted:
//            print("User may be restricted; for example, if the device is in Education mode, it limits external Apple Music usage. This is similar behaviour to Denied.")
//            return
//            
//        }
//        
//        SKCloudServiceController.requestAuthorization { (status:SKCloudServiceAuthorizationStatus) in
//            switch status {
//            case .authorized:
//                print("All good - the user tapped 'OK', so you're clear to move forward and start playing.")
//                
//            case .denied:
//                print("The user tapped 'Don't allow'. Read on about that below...")
//                
//            case .notDetermined:
//                print("The user hasn't decided or it's not clear whether they've confirmed or denied.")
//                
//            case .restricted:
//                print("User may be restricted; for example, if the device is in Education mode, it limits external Apple Music usage. This is similar behaviour to Denied.")
//                
//            }
//            
//        }
//    }
//    
//    func appleMusicFetchStorefrontRegion() {
//        
//        let serviceController = SKCloudServiceController()
//        serviceController.requestStorefrontIdentifier { (storefrontId:String?, err: Error?) in
//            
//            guard err == nil else {
//                
//                print("An error occured. Handle it here.")
//                return
//                
//            }
//            
//            guard let storefrontId = storefrontId, storefrontId.characters.count >= 6 else {
//                
//                print("Handle the error - the callback didn't contain a valid storefrontID.")
//                return
//                
//            }
//            
//            print("Success! The user's storefront ID is: \(storefrontId)")
//            
//        }
//        
//    }
//    
//    func appleMusicPlayTrackId(ids: [String]) {
//        systemMusicPlayer.setQueue(with: ids)
//        systemMusicPlayer.play()
//        let item = systemMusicPlayer.nowPlayingItem
//        print(item!.lyrics)
//    }
//    
//}
