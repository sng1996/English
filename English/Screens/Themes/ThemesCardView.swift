////
////  ThemesCardView.swift
////  English
////
////  Created by Сергей Гаврилко on 25/01/2019.
////  Copyright © 2019 gavrilko. All rights reserved.
////
//
//import UIKit
//
//class ThemesCardView: UIView {
//    
//    var sourceItem: Any? {
//        didSet {
//            guard let item = sourceItem as? Theme else { return }
//            imageView.image = UIImage(named: "History")
//            headerLabel.text = item.name
//            footerLabel.text = item.getCounts()
//        }
//    }
//    
//    let container = UIView()
//    
//    let imageContainer: UIView = {
//        let view = UIView()
//        view.layer.setShadow(offset: CGSize(width: 3, height: 3))
//        return view
//    }()
//    
//    let imageView: ImageView = {
//        let imageView = ImageView()
//        imageView.layer.cornerRadius = 5
//        imageView.layer.masksToBounds = true
//        imageView.contentMode = .scaleAspectFill
//        return imageView
//    }()
//    
//    let headerLabel = UILabel(
//        font: UIFont.book(20),
//        lines: 1,
//        scale: 0.5
//    )
//    
//    let footerLabel = UILabel(
//        color: UIColor(rgb: 0xCBCBCB),
//        font: UIFont.book(16),
//        lines: 1
//    )
//    
//    let imageSize = CGSize(
//        width: 228 * Screen.widthCoef,
//        height: 258 * Screen.widthCoef
//    )
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    init() {
//        super.init(frame: .zero)
//        setupViews()
//    }
//    
//    func setupViews() {
//        imageContainer.addObserver(self, forKeyPath: #keyPath(UIView.bounds), options: .new, context: nil)
//        
//        addSubview(container)
//        container.addSubview(imageContainer)
//        container.addSubview(headerLabel)
//        container.addSubview(footerLabel)
//        imageContainer.addSubview(imageView)
//        
//        addConstraintsWithFormat(format: "H:|[v0]|", views: container)
//        addConstraintsWithFormat(format: "V:|[v0]|", views: container)
//        
//        addConstraintsWithFormat(format: "H:|[v0(\(imageSize.width))]-5-|", views: imageContainer)
//        addConstraintsWithFormat(format: "H:|[v0]|", views: headerLabel)
//        addConstraintsWithFormat(format: "H:|[v0]|", views: footerLabel)
//        addConstraintsWithFormat(format: "V:|[v0(\(imageSize.height))]-15-[v1]-4-[v2]|", views: imageContainer, headerLabel, footerLabel)
//        
//        addConstraintsWithFormat(format: "H:|[v0]|", views: imageView)
//        addConstraintsWithFormat(format: "V:|[v0]|", views: imageView)
//    }
//    
//    func update() {
//        guard let item = sourceItem as? Theme else { return }
//        footerLabel.text = item.getCounts()
//    }
//    
//    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if let objectView = object as? UIView,
//            objectView === imageView,
//            keyPath == #keyPath(UIView.bounds) {
//            imageContainer.layer.shadowPath = UIBezierPath(roundedRect: imageContainer.bounds, cornerRadius: 5).cgPath
//        }
//    }
//    
//}
