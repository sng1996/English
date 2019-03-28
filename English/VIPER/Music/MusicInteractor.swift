//
//  MusicInteractor.swift
//  English
//
//  Created by Сергей Гаврилко on 27/03/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class MusicInteractor {
    
    weak var presenter: MusicPresenterProtocol!
    
    var songs: [Song] = []
    
    required init(presenter: MusicPresenterProtocol) {
        self.presenter = presenter
    }
    
}

extension MusicInteractor: MusicInteractorProtocol {

    var numberOfItems: Int {
        get {
            return songs.count
        }
    }
    
    func itemAt(_ index: Int) -> Song {
        return songs[index]
    }
    
    func search(_ text: String) {
        MusicAPI().search(text).done { songs in
            self.songs = songs
            if let presenter = self.presenter {
                presenter.updateView()
            }
        }.catch { error in
            print(error)
        }
    }
    
}
