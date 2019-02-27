//
//  NewThemeView.swift
//  English
//
//  Created by Сергей Гаврилко on 15/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

protocol NewThemeViewDelegate {
    func viewDidAppear()
    func presentInbox()
}

class NewThemeView: UIView {

    var sourceItem: Any? {
        didSet {
            guard let item = sourceItem as? ThemesCardView else { return }
            guard let theme = item.sourceItem as? Theme else { return }
            imageView.image = UIImage(named: theme.filename)
            headerLabel.text = theme.name
            footerLabel.text = theme.getCounts()
            vm.loadData(theme: theme)
            tv.reloadData()
            open(item)
            
            if theme.countArchive == 0 {
                toBottomButton.isHidden = true
            } else {
                toBottomButton.isHidden = false
            }
        }
    }
    
    let scrollView = ScrollView()
    
    let scrollContainer = UIView()
    
    let imageView: ImageView = {
        let imageView = ImageView()
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let headerLabel = UILabel(
        font: UIFont.book(36),
        lines: 1,
        scale: 0.5
    )
    
    let footerLabel = UILabel(
        color: UIColor(rgb: 0x9B9B9B),
        font: UIFont.book(20)
    )
    
    let tv = NewThemeTableView()
    
    let backButton = BackButton()
    
    let addButton = NewThemeAddButton()
    
    let toBottomButton = NewThemeToBottomButton()
    
    let vm = NewThemeViewModel()
    
    let imageSize = CGSize(
        width: 414 * Screen.widthCoef,
        height: 280 * Screen.widthCoef
    )
    
    //  Используется при закрытии следующего экрана, для анимации картинки на свое место
    var currentImageViewFrame: CGRect?
    var themes: [Theme] = []
    var tvHeightAnchor: NSLayoutConstraint!
    var imageViewLeftAnchor: NSLayoutConstraint!
    var imageViewTopAnchor: NSLayoutConstraint!
    var imageViewTopScrollAnchor: NSLayoutConstraint!
    var imageViewWidthAnchor: NSLayoutConstraint!
    var imageViewHeightAnchor: NSLayoutConstraint!
    var delegate: NewThemeViewDelegate!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        setupViews()
        MainViewController.tabBarView.hide()
    }
    
}
