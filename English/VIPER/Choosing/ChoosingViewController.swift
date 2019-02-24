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
    
    init() {
        super.init(frame: .zero)
        configurator.configure(with: self)
        setupViews()
        viewDidAppear()
    }
    
    func setupViews() {
        cv.delegate = self
        cv.dataSource = self
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
    
    func didTapBackButton() {
        presenter.didTapBackButton()
    }
    
    func didTapNextButton() {
        presenter.didTapNextButton()
    }
    
}

extension ChoosingViewController: ChoosingViewProtocol {
    
    func viewDidAppear() {
        presenter.configureView()
    }
    
    func update() {
        sourceItem = presenter.currentItem
    }
    
    func update(isRight: Bool, indexPath: IndexPath) {
        cv.update(isRight: isRight, indexPath: indexPath, complete: )
        if !isRight {
            nextButton.isHidden = true
        }
    }
    
    @objc
    func finishStep() {
        countLabel.text = vm.getCountLabelText()
        
        hide(complete: {
            self.startNextStep()
        })
    }
    
    @objc
    func startNextStep() {
        guard let chooseItem = vm.getNextChooseItem() else {
            openResultView()
            return
        }
        
        speechManager.play(chooseItem.originalWord.original!)
        headerLabel.text = chooseItem.originalWord.original
        cv.reloadData()
        show()
    }
    
    func show() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.headerLabel.alpha = 1.0
            self.footerLabel.alpha = 1.0
            self.cv.alpha = 1.0
        }, completion: nil)
    }
    
    func hide(complete: @escaping () -> ()) {
        for cell in cv.visibleCells {
            (cell as! ChoosingCell).clean()
        }
        hideNextStepButton()
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.headerLabel.alpha = 0.0
            self.footerLabel.alpha = 0.0
            self.cv.alpha = 0.0
        }, completion: { finished in
            complete()
        })
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

