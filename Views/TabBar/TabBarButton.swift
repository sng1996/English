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
    
    let badge: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(rgb: 0xF95454)
        view.layer.cornerRadius = 2
        view.isHidden = true
        return view
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
        addSubview(badge)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        badge.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: item.size.width),
            imageView.heightAnchor.constraint(equalToConstant: item.size.height),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            badge.widthAnchor.constraint(equalToConstant: 4),
            badge.heightAnchor.constraint(equalToConstant: 4),
            badge.leftAnchor.constraint(equalTo: imageView.rightAnchor),
            badge.bottomAnchor.constraint(equalTo: imageView.topAnchor)
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
    
    func showBadge() {
        badge.isHidden = false
    }
    
    func hideBadge() {
        badge.isHidden = true
    }
    
}
