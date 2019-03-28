//
//  LyricsViewController.swift
//  English
//
//  Created by Сергей Гаврилко on 28/03/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import DynamicBlurView
import UIKit

class LyricsViewModelData {
    
    var header: String
    var footer: String
    var coverURL: String
    var lyrics: String
    
    init(_ song: Song) {
        header = song.title
        footer = song.artist
        coverURL = song.imageURL
        lyrics = song.lyrics
    }
    
}

class LyricsViewController: UIView {

    var presenter: LyricsPresenterProtocol!
    var configurator: LyricsConfiguratorProtocol = LyricsConfigurator()
    
    var sourceItem: Any? {
        didSet {
            guard let model = sourceItem as? LyricsViewModelData else { return }
            backCachedImageView.loadImage(urlString: model.coverURL)
            coverCachedImageView.loadImage(urlString: model.coverURL)
            headerLabel.text = model.header
            footerLabel.text = model.footer
            createBlurView()
            
            let style = NSMutableParagraphStyle()
            style.lineSpacing = 7
            let atributes = [NSAttributedString.Key.paragraphStyle: style, NSAttributedString.Key.font: UIFont.book(22)]
            textView.attributedText = NSAttributedString(string: model.lyrics, attributes: atributes)
        }
    }
    
    let backCachedImageView = CachedImageView(emptyImage: UIImage(named: "MusicEmpty")!)
    
    let container = UIView()
    
    let coverCachedImageView = CachedImageView(emptyImage: UIImage(named: "MusicEmpty")!)
    
    let headerLabel = UILabel(
        color: .white,
        font: UIFont.medium(30),
        lines: 1,
        scale: 0.5
    )
    
    let footerLabel = UILabel(
        color: .white,
        font: UIFont.book(18),
        lines: 1,
        scale: 0.5
    )
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.book(18)
        textView.isEditable = false
        textView.tintColor = UIColor(rgb: 0x53D397)
        textView.textContainerInset = UIEdgeInsets.zero
        textView.textContainer.lineFragmentPadding = 0
        textView.showsVerticalScrollIndicator = false
        return textView
    }()
    
    let backButton = BackButton()
    
    let translateButton = LyricsTranslateButton()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(with song: Song) {
        super.init(frame: .zero)
        configurator.configure(with: self, data: song)
        setupViews()
    }
    
    func setupViews() {
        backgroundColor = .white
        coverCachedImageView.layer.cornerRadius = 3
        translateButton.isHidden = true
        
        textView.delegate = self
        
        let side = 70 * Screen.heightCoef
        let height = 177 * Screen.heightCoef
        
        addSubview(backCachedImageView)
        addSubview(container)
        container.addSubview(coverCachedImageView)
        container.addSubview(headerLabel)
        container.addSubview(footerLabel)
        addSubview(textView)
        addSubview(backButton)
        addSubview(translateButton)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: backCachedImageView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: container)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0(\(side))]-20-[v1]-\(Screen.sideInset)-|", views: coverCachedImageView, headerLabel)
        addConstraintsWithFormat(format: "H:[v0]-20-[v1]-\(Screen.sideInset)-|", views: coverCachedImageView, footerLabel)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: textView)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]", views: backButton)
        addConstraintsWithFormat(format: "H:[v0]-\(Screen.sideInset)-|", views: translateButton)
        
        addConstraintsWithFormat(format: "V:|[v0(\(height))]", views: backCachedImageView)
        addConstraintsWithFormat(format: "V:|[v0(\(height))]-20-[v1]-\(Screen.sideInset)-|", views: container, textView)
        addConstraintsWithFormat(format: "V:[v0]-\(Screen.sideInset + Screen.safeBottom / 2)-|", views: backButton)
        addConstraintsWithFormat(format: "V:[v0]-\(Screen.sideInset + Screen.safeBottom / 2)-|", views: translateButton)
        
        
        NSLayoutConstraint.activate([
            coverCachedImageView.heightAnchor.constraint(equalToConstant: side),
            coverCachedImageView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: container.centerYAnchor),
            footerLabel.topAnchor.constraint(equalTo: container.centerYAnchor)
        ])
    }
    
    func createBlurView() {
        layoutIfNeeded()
        let blurView = BlurView()
        blurView.frame = backCachedImageView.bounds
        blurView.alpha = 1.0
        backCachedImageView.addSubview(blurView)
    }
    
    func viewDidAppear() {
        presenter.configureView()
    }

}

extension LyricsViewController: LyricsViewProtocol { }

extension LyricsViewController: UITextViewDelegate {
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        if let textRange = textView.selectedTextRange {
            translateButton.isHidden = false
            print(textView.text(in: textRange)!)
        } else {
            translateButton.isHidden = true
            print("empty")
        }
    }
    
}
