//
//  CachedImageView.swift
//  English
//
//  Created by Сергей Гаврилко on 28/03/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class CachedImageView: UIImageView {

    static let imageCache = NSCache<NSString, DiscardableImageCacheItem>()
    
    private var urlStringForChecking: String?
    
    var emptyImage: UIImage?
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(emptyImage: UIImage = UIImage(named: "MusicEmpty")!) {
        self.emptyImage = emptyImage
        super.init(frame: .zero)
        image = emptyImage
        layer.masksToBounds = true
        contentMode = .scaleAspectFill
    }
    
    func loadImage(urlString: String, completion: (() -> ())? = nil) {
        image = emptyImage
        self.urlStringForChecking = urlString
        let urlKey = urlString as NSString
        
        if let cachedItem = CachedImageView.imageCache.object(forKey: urlKey) {
            image = cachedItem.image
            completion?()
            return
        }
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { [weak self] (data, response, error) in
            if error != nil {
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    let cacheItem = DiscardableImageCacheItem(image: image)
                    CachedImageView.imageCache.setObject(cacheItem, forKey: urlKey)
                    
                    if urlString == self?.urlStringForChecking {
                        self?.image = image
                        completion?()
                    }
                }
            }
            
        }).resume()
    }

}
