//
//  ChoosingViewController.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ChoosingViewControllerDataModel {
    
    var header: String
    var count: String
    
    init(header: String, count: String) {
        self.header = header
        self.count = count
    }
    
}

class ChoosingViewController: UIView {
    
    var presenter: ChoosingPresenterProtocol!
    var configurator: ChoosingConfiguratorProtocol = ChoosingConfigurator()
    
    var sourceItem: Any? {
        didSet {
            guard let model = sourceItem as? ChoosingViewControllerDataModel else { return }
            headerLabel.text = model.header
            countLabel.text = model.count
            cv.reloadData()
            showViews()
        }
    }
    
    let topContainer = UIView()
    
    let backButton = BackButton()
    
    let countLabel = UILabel(
        text: "0 из 10",
        color: UIColor(rgb: 0xE7E7E7),
        font: UIFont.book(18),
        alignment: .right
    )
    
    let headerLabel = UILabel(
        color: UIColor(rgb: 0x1A1A1A),
        font: UIFont.book(36),
        alignment: .center
    )
    
    let footerLabel = UILabel(
        text: "Выбери вариант перевода:",
        color: UIColor(rgb: 0xCBCBCB),
        font: UIFont.book(20),
        alignment: .center
    )
    
    let cv = ChoosingCollectionView()
    
    let nextButton: Button = {
        let view = Button()
        view.isHidden = true
        return view
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(with data: [WordData]) {
        super.init(frame: .zero)
        configurator.configure(with: self, data: data)
        setupViews()
    }
    
    func setupViews() {
        cv.delegate = self
        cv.dataSource = self
        cv.choosingDelegate = self
        backButton.tapHandler = didTapBackButton
        nextButton.tapHandler = didTapNextButton
        
        addSubview(topContainer)
        addSubview(headerLabel)
        addSubview(footerLabel)
        addSubview(cv)
        addSubview(nextButton)
        topContainer.addSubview(backButton)
        topContainer.addSubview(countLabel)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: topContainer)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: headerLabel)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: footerLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: cv)
        addConstraintsWithFormat(format: "H:|[v0]", views: backButton)
        addConstraintsWithFormat(format: "H:[v0]|", views: countLabel)
        
        addConstraintsWithFormat(format: "V:|-\(Screen.sideInset + Screen.safeTop)-[v0]-(>=\(Screen.sideInset))-[v1][v2(60)][v3(\(cv.height))]-\(Screen.safeBottom)-|", views: topContainer, headerLabel, footerLabel, cv)
        addConstraintsWithFormat(format: "V:|[v0]|", views: backButton)
        addConstraintsWithFormat(format: "V:|[v0]|", views: countLabel)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: nextButton)
        addConstraintsWithFormat(format: "V:|[v0]|", views: nextButton)
    }
    
    func viewDidAppear() {
        presenter.configureView()
    }
    
    func viewWillDisappear() {
        removeFromSuperview()
    }
    
    func didTapBackButton() {
        presenter.didTapBackButton()
    }
    
    func didTapNextButton() {
        hideViews(complete: {
            self.presenter.didFinishHideViews()
        })
    }
    
    func resultViewDidTapNext() {
        presenter.resultViewDidTapNext()
    }
    
    func resultViewDidTapRepeat() {
        presenter.resultViewDidTapRepeat()
    }
    
    func showViews() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.headerLabel.alpha = 1.0
            self.footerLabel.alpha = 1.0
            self.cv.alpha = 1.0
        }, completion: nil)
    }
    
    func hideViews(complete: @escaping () -> ()) {
        nextButton.isHidden = true
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.cv.alpha = 0.0
            self.headerLabel.alpha = 0.0
            self.footerLabel.alpha = 0.0
        }, completion: { finished in
            complete()
        })
    }
    
}

extension ChoosingViewController: ChoosingViewProtocol {
    
    func update(isRight: Bool, indexPath: IndexPath) {
        cv.update(isRight: isRight, indexPath: indexPath)
    }
    
}

extension ChoosingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cv.cellSize
    }
    
}

extension ChoosingViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.collectionViewDidSelectItemAt(indexPath)
    }
    
}

extension ChoosingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChoosingCell", for: indexPath) as! ChoosingCell
        cell.sourceItem = presenter.collectionViewItemAt(indexPath)
        return cell
    }
    
}

extension ChoosingViewController: ChoosingCollectionViewDelegate {
    
    func didFinishRightAnswerAnimation() {
        hideViews(complete: {
            self.presenter.didFinishHideViews()
        })
    }
    
    func getRightIndexPath() -> IndexPath {
        return presenter.rightIndexPath
    }
    
    func showNextButton() {
        nextButton.isHidden = false
    }
    
}

