//
//  MusicCell.swift
//  English
//
//  Created by Сергей Гаврилко on 28/03/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class MusicCellDataModel {
    
    var header: String
    var footer: String
    var coverURL: String
    
    init(_ song: Song) {
        self.header = song.title
        self.footer = song.artist
        self.coverURL = song.imageURL
    }
    
}

class MusicCell: UITableViewCell {

    var sourceItem: Any? {
        didSet {
            guard let model = sourceItem as? MusicCellDataModel else { return }
            coverImageView.loadImage(urlString: model.coverURL)
            headerLabel.text = model.header
            footerLabel.text = model.footer
        }
    }
    
    let coverImageView = CachedImageView(emptyImage: UIImage(named: "MusicEmpty")!)
    
    let headerLabel = UILabel(
        font: UIFont.medium(16),
        lines: 1
    )
    
    let footerLabel = UILabel(
        color: UIColor(rgb: 0x9B9B9B),
        font: UIFont.book(16),
        lines: 1
    )
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier
        )
        setupViews()
    }
    
    func setupViews() {
        selectionStyle = .none
        backgroundColor = .white
        coverImageView.layer.cornerRadius = 3
        
        addSubview(coverImageView)
        addSubview(headerLabel)
        addSubview(footerLabel)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0(40)]-15-[v1]-\(Screen.sideInset)-|", views: coverImageView, headerLabel)
        addConstraintsWithFormat(format: "H:[v0]-15-[v1]-\(Screen.sideInset)-|", views: coverImageView, footerLabel)
        
        addConstraintsWithFormat(format: "V:|-10-[v0(40)]-10-|", views: coverImageView)
        
        NSLayoutConstraint.activate([
            headerLabel.bottomAnchor.constraint(equalTo: centerYAnchor),
            footerLabel.topAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

}
