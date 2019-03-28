//
//  LyricsInteractor.swift
//  English
//
//  Created by Сергей Гаврилко on 28/03/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class LyricsInteractor {
    
    weak var presenter: LyricsPresenterProtocol!
    
    var song: Song
    
    required init(presenter: LyricsPresenterProtocol, data: Song) {
        self.presenter = presenter
        song = data
    }
    
}

extension LyricsInteractor: LyricsInteractorProtocol {
    
    func update() {
        MusicAPI().lyrics(song.url).done { text in
            self.song.lyrics = HTMLParser().parse(text)
            if let presenter = self.presenter {
                presenter.updateView()
            }
        }.catch { error in
            print(error)
        }
    }

    func getSong() -> Song {
        return song
    }
    
}
