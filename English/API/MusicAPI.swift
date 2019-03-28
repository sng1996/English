//
//  MusicAPI.swift
//  English
//
//  Created by Сергей Гаврилко on 28/03/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import PromiseKit
import UIKit

class MusicAPI: UIView {

    func search(_ text: String) -> Promise<[Song]> {
        let str = text.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
    
        return Promise { seal in
            API.request("search?q=\(str)").responseJSON { response in
                switch response.result {
                case .success(let json):
                    guard let json = json as? [String: Any] else {
                        return seal.reject(AFError.responseValidationFailed(reason: .dataFileNil))
                    }
                    let songs = JSONDecoder().toSongs(json)
                    seal.fulfill(songs)
                case .failure(let error):
                    seal.reject(error)
                    print(error)
                }
            }
        }
    }
    
    func lyrics(_ url: String) -> Promise<String> {
        return Promise { seal in
            Alamofire.request(url).responseString { response in
                if let html = response.result.value {
                    seal.fulfill(html)
                } else {
                    seal.reject("ERROR" as! Error)
                }
            }
        }
    }

}
