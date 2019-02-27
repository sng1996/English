////
////  SingleThemeView.swift
////  English
////
////  Created by Сергей Гаврилко on 21/01/2019.
////  Copyright © 2019 gavrilko. All rights reserved.
////
//
//import UIKit
//
//protocol SingleThemeViewDelegate {
//    func viewDidAppear()
//    func presentInbox()
//}
//
//class SingleThemeView: UIView {
//    
//    var sourceItem: Any? {
//        didSet {
//            guard let theme = sourceItem as? Theme else { return }
//            headerLabel.text = theme.name
//            footerLabel.text = theme.getCounts()
//            vm.loadData(theme: theme)
//            tv.reloadData()
//        }
//    }
//
//    let scrollView = ScrollView(inset: 2 * Screen.sideInset + 40)
//    
//    let scrollContainer = UIView()
//    
//    let headerLabel = UILabel(
//        font: UIFont.book(36)
//    )
//    
//    let footerLabel = UILabel(
//        color: UIColor(rgb: 0x9B9B9B),
//        font: UIFont.book(20)
//    )
//    
//    let tv = SingleThemeTableView()
//    
//    let backButton = BackButton()
//    
//    let addButton = SingleThemeAddButton()
//    
//    let vm = SingleThemeViewModel()
//    
//    var tvHeightAnchor: NSLayoutConstraint!
//    var delegate: SingleThemeViewDelegate!
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    init() {
//        super.init(frame: .zero)
//        backgroundColor = .white
//        setupViews()
//    }
//    
//}
