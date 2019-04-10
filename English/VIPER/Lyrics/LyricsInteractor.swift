//
//  LyricsInteractor.swift
//  English
//
//  Created by Сергей Гаврилко on 28/03/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import MediaPlayer
import StoreKit
import UIKit

class LyricsInteractor {
    
    weak var presenter: LyricsPresenterProtocol!
    let systemMusicPlayer = MPMusicPlayerController.systemMusicPlayer
    
    var song: Song
    var word: Word?
    let onlineDictionary = OnlineDictionary()
    let offlineDictionary = OfflineDictionary()
    
    required init(presenter: LyricsPresenterProtocol, data: Song) {
        self.presenter = presenter
        song = data
        onlineDictionary.delegate = self
    }
    
}

extension LyricsInteractor: LyricsInteractorProtocol, ServiceProvider {
    
    func update() {
        MusicAPI().lyrics(song.url).done { text in
            self.song.lyrics = HTMLParser().parse(text)
            if let presenter = self.presenter {
                presenter.updateView()
            }
        }.catch { error in
            print(error)
        }
        
        appleMusicCheckIfDeviceCanPlayback()
        appleMusicRequestPermission()
        appleMusicFetchStorefrontRegion()
        appleMusicPlayTrackId(ids: ["2949128"])
    }

    func getSong() -> Song {
        return song
    }
    
    func translate(_ text: String) {
        let words = offlineDictionary.query(text: text.lowercased())
        if words.isEmpty || words[0].original.lowercased() != text.lowercased() {
            onlineDictionary.getTk(text)
        } else {
            self.word = words[0]
            presenter.didFinishTranslate(words[0])
        }
    }
    
    func changeTranslate(with text: String) {
        self.word?.translate = text
    }
    
    func createWord() {
        if let word = word {
            let language = onlineDictionary.detectLanguage(text: word.original)
            var original = ""
            var translate = ""
            
            if language == Language.ru {
                original = word.translate
                translate = word.original
            } else {
                original = word.original
                translate = word.translate
            }
            
            wordDataService.createWord(
                original: original,
                translate: translate,
                translates: word.translates
            )
        }
    }
    
    func appleMusicCheckIfDeviceCanPlayback() {
        let serviceController = SKCloudServiceController()
        serviceController.requestCapabilities { (capability: SKCloudServiceCapability, err: Error?) in
            switch capability {
            case []:
                print("The user doesn't have an Apple Music subscription available. Now would be a good time to prompt them to buy one?")
    
            case SKCloudServiceCapability.musicCatalogPlayback:
                print("The user has an Apple Music subscription and can playback music!")
    
            case SKCloudServiceCapability.addToCloudMusicLibrary:
                print("The user has an Apple Music subscription, can playback music AND can add to the Cloud Music Library")
    
            default: break
            }
    
        }
    }
    
    func appleMusicRequestPermission() {
        switch SKCloudServiceController.authorizationStatus() {
        case .authorized:
            print("The user's already authorized - we don't need to do anything more here, so we'll exit early.")
            return
    
        case .denied:
            print("The user has selected 'Don't Allow' in the past - so we're going to show them a different dialog to push them through to their Settings page and change their mind, and exit the function early.")
    
            // Show an alert to guide users into the Settings
    
            return
    
        case .notDetermined:
            print("The user hasn't decided yet - so we'll break out of the switch and ask them.")
            break
    
        case .restricted:
            print("User may be restricted; for example, if the device is in Education mode, it limits external Apple Music usage. This is similar behaviour to Denied.")
            return
    
        }
    
        SKCloudServiceController.requestAuthorization { (status:SKCloudServiceAuthorizationStatus) in
            switch status {
            case .authorized:
                print("All good - the user tapped 'OK', so you're clear to move forward and start playing.")
    
            case .denied:
                print("The user tapped 'Don't allow'. Read on about that below...")
    
            case .notDetermined:
                print("The user hasn't decided or it's not clear whether they've confirmed or denied.")
    
            case .restricted:
                print("User may be restricted; for example, if the device is in Education mode, it limits external Apple Music usage. This is similar behaviour to Denied.")
    
            }
    
        }
    }
    
    func appleMusicFetchStorefrontRegion() {
    
        let serviceController = SKCloudServiceController()
        serviceController.requestStorefrontIdentifier { (storefrontId:String?, err: Error?) in
    
            guard err == nil else {
    
                print("An error occured. Handle it here.")
                return
    
            }
    
            guard let storefrontId = storefrontId, storefrontId.characters.count >= 6 else {
    
                print("Handle the error - the callback didn't contain a valid storefrontID.")
                return
    
            }
    
            print("Success! The user's storefront ID is: \(storefrontId)")
    
        }
    
    }
    
    func appleMusicPlayTrackId(ids: [String]) {
        systemMusicPlayer.setQueue(with: ids)
        systemMusicPlayer.play()
    }
    
    
    
    
}

extension LyricsInteractor: OnlineDictionaryDelegate {
    
    func didFinishTranslate(_ word: Word) {
        self.word = word
        presenter.didFinishTranslate(word)
    }
    
}
