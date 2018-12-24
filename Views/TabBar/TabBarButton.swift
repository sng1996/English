//
//  TabBarButton.swift
//  English
//
//  Created by Сергей Гаврилко on 23/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

struct ImageItem {
    let image: UIImage
    let activatedImage: UIImage
    let size: CGSize
}

class TabBarButton: Button {
    
    var item: ImageItem
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        return imageView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(item: ImageItem) {
        self.item = item
        super.init()
        setupViews()
    }
    
    func setupViews() {
        imageView.image = item.image
        addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: item.size.width),
            imageView.heightAnchor.constraint(equalToConstant: item.size.height),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func activate() {
        imageView.image = item.activatedImage
    }
    
    func deactivate() {
        imageView.image = item.image
    }
    
    override func didTap() {
        super.didTap()
        activate()
    }
    
}
