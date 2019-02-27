////
////  ThemesCellView.swift
////  English
////
////  Created by Сергей Гаврилко on 25/01/2019.
////  Copyright © 2019 gavrilko. All rights reserved.
////
//
//import UIKit
//
//protocol ThemesCellViewDelegate {
//    func open(cardView: ThemesCardView)
//}
//
//class ThemesCellView: UIView {
//    
//    var sourceItem: Any? {
//        didSet {
//            guard let item = sourceItem as? Theme else { return }
//            headerLabel.text = item.name
//            footerLabel.text = item.getCounts()
//            setupCardViews(item.subthemes)
//        }
//    }
//
//    let line = Line()
//    
//    let headerLabel = UILabel(
//        font:UIFont.book(24),
//        lines: 1
//    )
//    
//    let footerLabel = UILabel(
//        color: UIColor(rgb: 0xCBCBCB),
//        font: UIFont.medium(16),
//        lines: 1
//    )
//    
//    let scrollView: UIScrollView = {
//        let scrollView = UIScrollView()
//        scrollView.showsHorizontalScrollIndicator = false
//        scrollView.contentInset.left = Screen.sideInset
//        scrollView.contentInset.right = Screen.sideInset
//        return scrollView
//    }()
//    
//    let scrollContainer = UIView()
//    
//    var cardViews: [ThemesCardView] = []
//    var delegate: ThemesCellViewDelegate!
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
//        addSubview(line)
//        addSubview(headerLabel)
//        addSubview(footerLabel)
//        addSubview(scrollView)
//        scrollView.addSubview(scrollContainer)
//        
//        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: line)
//        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: headerLabel)
//        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: footerLabel)
//        addConstraintsWithFormat(format: "H:|[v0]|", views: scrollView)
//        addConstraintsWithFormat(format: "H:|[v0]|", views: scrollContainer)
//        
//        let view = ThemesCardView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.container.layoutIfNeeded()
//        
//        addConstraintsWithFormat(format: "V:|[v0(1)]-20-[v1]-4-[v2]-25-[v3(\(view.container.frame.height))]-15-|", views: line, headerLabel, footerLabel, scrollView)
//        addConstraintsWithFormat(format: "V:|[v0]|", views: scrollContainer)
//    }
//    
//    func setupCardViews(_ themes: [Theme]) {
//        for i in themes.indices {
//            let cardView = ThemesCardView()
//            cardView.sourceItem = themes[i]
//            cardView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(open)))
//            cardViews.append(cardView)
//            scrollContainer.addSubview(cardView)
//            
//            cardView.translatesAutoresizingMaskIntoConstraints = false
//            NSLayoutConstraint.activate([
//                cardView.topAnchor.constraint(equalTo: scrollContainer.topAnchor),
//                cardView.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor)
//            ])
//            
//            if i == 0 {
//                cardView.leftAnchor.constraint(equalTo: scrollContainer.leftAnchor).isActive = true
//            } else if i == themes.count - 1 {
//                NSLayoutConstraint.activate([
//                    cardView.leftAnchor.constraint(equalTo: cardViews[i - 1].rightAnchor, constant: 10),
//                    cardView.rightAnchor.constraint(equalTo: scrollContainer.rightAnchor)
//                ])
//            } else {
//                cardView.leftAnchor.constraint(equalTo: cardViews[i - 1].rightAnchor, constant: 10).isActive = true
//            }
//        }
//    }
//    
//    func update() {
//        for view in cardViews {
//            view.update()
//        }
//        guard let item = sourceItem as? Theme else { return }
//        footerLabel.text = item.getCounts()
//    }
//    
//    @objc
//    func open(gesture: UITapGestureRecognizer) {
//        guard let view = gesture.view as? ThemesCardView else { return }
//        delegate.open(cardView: view)
//    }
//    
//}
