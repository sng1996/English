//
//  ResultViewController.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ResultViewControllerDataModel {
    
    var header: String
    var footer: String
    
    init(header: String, footer: String) {
        self.header = header
        self.footer = footer
    }
    
}

class ResultViewController: UIView {
    
    var presenter: ResultPresenterProtocol!
    var configurator: ResultConfiguratorProtocol = ResultConfigurator()
    
    var sourceItem: Any? {
        didSet {
            guard let model = sourceItem as? ResultViewControllerDataModel else { return }
            headerLabel.text = model.header
            footerLabel.text = model.footer
        }
    }
    
    let imageView = ImageView(name: "Result_green")
    
    let headerLabel = UILabel(
        color: UIColor(rgb: 0x1A1A1A),
        font: UIFont.book(36),
        alignment: .center,
        scale: 0.5
    )
    
    let footerLabel = UILabel(
        color: UIColor(rgb: 0x030303),
        font: UIFont.medium(20),
        alignment: .center,
        scale: 0.5
    )
    
    let nextButton = ResultNextButton()
    
    let returnButton = ResultReturnButton()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        configurator.configure(with: self)
        setupViews()
        viewDidAppear()
    }
    
    func setupViews() {
        nextButton.tapHandler = didTapNextButton
        returnButton.tapHandler = didTapReturnButton
        
        addSubview(imageView)
        addSubview(headerLabel)
        addSubview(footerLabel)
        addSubview(nextButton)
        addSubview(returnButton)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: headerLabel)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: footerLabel)
        addConstraintsWithFormat(format: "V:[v0]-35-[v1]-10-[v2]", views: imageView, headerLabel, footerLabel)
        addConstraintsWithFormat(format: "V:[v0]-15-[v1]-50-|", views: nextButton, returnButton)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 93),
            imageView.heightAnchor.constraint(equalToConstant: 93),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            footerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nextButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            returnButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            footerLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func didTapNextButton() {
        presenter.didTapNextButton()
    }
    
    func didTapReturnButton() {
        presenter.didTapReturnButton()
    }
    
}

extension ResultViewController: ResultViewProtocol {
    
    func viewDidAppear() {
        presenter.configureView()
    }
    
}
