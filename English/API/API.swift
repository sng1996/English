//
//  API.swift
//  English
//
//  Created by Сергей Гаврилко on 28/03/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import Alamofire
import UIKit

class API {
    
    static var headers: [String: String] = [:]
    static var accessToken = "iKvksDlzMvtYMeMP_D_20lh5SAyugIzzpH7w8ZeMuD6dJ4bw0Z4oEnfanC0uqDnv"

    static func request(_ url: String, method: HTTPMethod = .get, parameters: Parameters? = nil, encoding: ParameterEncoding = JSONEncoding.default, headers: HTTPHeaders? = headers) -> DataRequest {
        return Alamofire.SessionManager.default.requestWithoutCache(
            "https://api.genius.com/\(url)&access_token=\(accessToken)",
            method: method,
            parameters: parameters,
            encoding: encoding,
            headers: headers
        ).validate()
    }
    
    static func requestWithURL(_ url: String, method: HTTPMethod = .get, parameters: Parameters? = nil, encoding: ParameterEncoding = JSONEncoding.default, headers: HTTPHeaders? = headers) -> DataRequest {
        return Alamofire.SessionManager.default.requestWithoutCache(
            url,
            method: method,
            parameters: parameters,
            encoding: encoding,
            headers: headers
        ).validate()
    }

}
