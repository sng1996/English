//
//  Song.swift
//  English
//
//  Created by Сергей Гаврилко on 28/03/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class Song {

    var id: Int
    var title: String
    var artist: String
    var lyrics: String
    var imageURL: String
    var url: String
    
    init(id: Int, title: String, artist: String, lyrics: String = "", imageURL: String, url: String) {
        self.id = id
        self.title = title
        self.artist = artist
        self.lyrics = lyrics
        self.imageURL = imageURL
        self.url = url
    }

}
