//
//  SpellingViewController.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class SpellingViewDataModel {
    
    var header: String
    var count: String
    
    init(header: String, count: String) {
        self.header = header
        self.count = count
    }
    
}

class SpellingViewController: UIViewController {
    
    var presenter: SpellingPresenterProtocol!
    var configurator: SpellingConfiguratorProtocol = SpellingConfigurator()
    
    var data: [WordData] = [] {
        didSet {
            configurator.configure(with: self, data: data)
        }
    }
    
    let backButton = BackButton()
    
    let cv = SpellingCollectionView()
    
    let countLabel = UILabel(
        color: UIColor(rgb: 0x4D4D4D),
        font: UIFont.medium(18)
    )
    
    let checkLabel = UILabel(
        text: "Проверить",
        color: UIColor(rgb: 0x53D397),
        font: UIFont.medium(18)
    )
    
    let mockTextField: UITextField = {
        let textField = UITextField()
        textField.returnKeyType = .done
        textField.autocorrectionType = .no
        textField.alpha = 0.0
        return textField
    }()
    
    var currentCell: SpellingCell!
    var keyboardHeight: CGFloat = 0.0
    var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(rgb: 0xFBFBFB)
        checkLabel.alpha = 0.0
        presenter.configureView()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        view.addSubview(mockTextField)
        mockTextField.becomeFirstResponder()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        keyboardHeight = 0.0
    }
    
    func setupViews() {
        updateCountLabel()
        hideViews()
        
        checkLabel.isUserInteractionEnabled = true
        checkLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapCheckButton)))
        backButton.tapHandler = didTapBackButton
        cv.dataSource = self
        
        view.addSubview(backButton)
        view.addSubview(cv)
        view.addSubview(countLabel)
        view.addSubview(checkLabel)
        
        let countLabelHeight: CGFloat = 55 * Screen.heightCoef
        
        view.addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]", views: backButton)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: cv)
        view.addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]->=15-[v1]-\(Screen.sideInset)-|", views: countLabel, checkLabel)
        
        view.addConstraintsWithFormat(format: "V:|-\(Screen.sideInset + Screen.safeTop)-[v0]-\(Screen.sideInset)-[v1][v2(\(countLabelHeight))]", views: backButton, cv, countLabel)
        
        bottomConstraint = countLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -keyboardHeight)
        
        NSLayoutConstraint.activate([
            checkLabel.centerYAnchor.constraint(equalTo: countLabel.centerYAnchor),
            checkLabel.heightAnchor.constraint(equalTo: countLabel.heightAnchor),
            bottomConstraint
        ])
    }
    
    func didTapBackButton() {
        presenter.didTapBackButton()
    }
    
    @objc func didTapCheckButton() {
        presenter.didTapCheckButton(with: currentCell.text)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        if let userInfo = notification.userInfo {
            let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
            
            if keyboardHeight == 0 {
                keyboardHeight = keyboardFrame.height
                setupViews()
                showViews()
            }
        }
    }
    
    func showViews() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
            self.backButton.alpha = 1.0
            self.cv.alpha = 1.0
            self.countLabel.alpha = 1.0
        }, completion: nil)
    }
    
    func hideViews() {
        backButton.alpha = 0.0
        cv.alpha = 0.0
        countLabel.alpha = 0.0
    }
    
    func showCheckLabel() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.checkLabel.alpha = 1.0
        }, completion: nil)
    }
    
    func hideCheckLabel() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.checkLabel.alpha = 0.0
        }, completion: nil)
    }
    
    func updateCountLabel() {
        countLabel.text = presenter.getCountLabelText()
    }
    
}

extension SpellingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.collectionViewNumberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SpellingCell", for: indexPath) as! SpellingCell
        cell.sourceItem = presenter.collectionViewDataForItemAt(indexPath)
        cell.delegate = self
        
        if indexPath.row == 0 {
            currentCell = cell
            currentCell.textField.becomeFirstResponder()
        }
        
        return cell
    }

}

extension SpellingViewController: SpellingViewProtocol {
    
    func update() {
        updateCountLabel()
        cv.contentOffset.x = 0
        cv.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.currentCell.textField.becomeFirstResponder()
        }
    }
    
    func updateWithRed() {
        currentCell.setRed()
    }
    
    func updateWithGreen() {
        currentCell.setGreen()
    }
    
    func insert(at indexPaths: [IndexPath]) {
        cv.insertItems(at: indexPaths)
    }
    
    func scrollToNext(_ indexPath: IndexPath) {
        updateCountLabel()
        currentCell = cv.cellForItem(at: indexPath) as? SpellingCell
        currentCell.textField.becomeFirstResponder()
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            let padding = self.cv.layout.cellPadding
            self.cv.contentOffset.x += self.cv.bounds.width - 6 * padding
        }, completion: nil)
    }
    
    func openResultView(with model: ResultViewDataModel) {
        currentCell.textField.resignFirstResponder()
        
        let resultView = ResultView()
        resultView.sourceItem = model
        resultView.delegate = self
        view.addSubview(resultView)
        
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: resultView)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: resultView)
    }
    
}

extension SpellingViewController: SpellingCellDelegate {
    
    func textFieldDidChange(with text: String) {
        if text == "" {
            hideCheckLabel()
        } else {
            showCheckLabel()
        }
        presenter.textFieldDidChange(with: text)
    }
    
    func didTapAnswerButton() {
        let answer = presenter.getAnswer()
        currentCell.show(answer)
    }
    
    func didTapDoneButton() {
        presenter.didTapCheckButton(with: currentCell.text)
    }
    
}

extension SpellingViewController: ResultViewDelegate {
    
    func resultViewDidTapNextButton() {
        presenter.resultViewDidTapNext()
    }
    
    func resultViewDidTapRepeatButton() {
        presenter.resultViewDidTapRepeat()
    }
    
}
