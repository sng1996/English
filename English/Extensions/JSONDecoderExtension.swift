//
//  JSONDecoderExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 28/03/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

extension JSONDecoder {

    func toSongs(_ json: [String : Any]) -> [Song] {
        var songs: [Song] = []
        
        if let response = json["response"] as? [String : AnyObject] {
            if let hits = response["hits"] as? [[String : AnyObject]] {
                for hit in hits {
                    if let result = hit["result"] as? [String : AnyObject] {
                        songs.append(toSong(result))
                    }
                }
            }
        }
        
        return songs
    }
    
    func toSong(_ json: [String : Any]) -> Song {
        var artist = ""
        if let primaryArtist = json["primary_artist"] as? [String : AnyObject] {
            artist = primaryArtist["name"] as? String ?? ""
        }
        
        return Song(
            id: json["id"] as? Int ?? 0,
            title: json["full_title"] as? String ?? "",
            artist: artist,
            imageURL: json["header_image_thumbnail_url"] as? String ?? "",
            url: json["url"] as? String ?? ""
        )
    }

}
