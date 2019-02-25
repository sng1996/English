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
    
    let backImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        return imageView
    }()
    
    let frontImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.alpha = 0.0
        return imageView
    }()
    
    let badge: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(rgb: 0xF95454)
        view.layer.cornerRadius = 2
        view.isHidden = true
        return view
    }()
    
    var isActive: Bool = false {
        didSet {
            isActive ? activate() : deactivate()
        }
    }
    
    var isBadgeActive: Bool = false {
        didSet {
            badge.isHidden = !isBadgeActive
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(item: ImageItem) {
        self.item = item
        super.init()
        setupViews()
    }
    
    func setupViews() {
        backImageView.image = item.image
        frontImageView.image = item.activatedImage
        addSubview(backImageView)
        addSubview(frontImageView)
        addSubview(badge)
        
        backImageView.translatesAutoresizingMaskIntoConstraints = false
        frontImageView.translatesAutoresizingMaskIntoConstraints = false
        badge.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backImageView.widthAnchor.constraint(equalToConstant: item.size.width),
            backImageView.heightAnchor.constraint(equalToConstant: item.size.height),
            backImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            backImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            frontImageView.widthAnchor.constraint(equalToConstant: item.size.width),
            frontImageView.heightAnchor.constraint(equalToConstant: item.size.height),
            frontImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            frontImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            badge.widthAnchor.constraint(equalToConstant: 4),
            badge.heightAnchor.constraint(equalToConstant: 4),
            badge.leftAnchor.constraint(equalTo: backImageView.rightAnchor),
            badge.bottomAnchor.constraint(equalTo: backImageView.topAnchor)
        ])
    }
    
    private func activate() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.frontImageView.alpha = 1.0
        }, completion: nil)
    }
    
    private func deactivate() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.frontImageView.alpha = 0.0
        }, completion: nil)
    }
    
    override func didTap() {
        super.didTap()
        isActive = true
    }
    
}
