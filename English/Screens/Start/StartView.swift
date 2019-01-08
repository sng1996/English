//
//  StartView.swift
//  English
//
//  Created by Сергей Гаврилко on 26/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

protocol StartViewDelegate {
    func openChoosingView(_ words: [WordData])
}

class StartView: UIView {
    
    var sourceItem: Any? {
        didSet {
            guard let _ = sourceItem as? [WordData] else { return }
            cardsView.reloadData()
        }
    }

    let headerContainer = UIView()
    
    let headerLabel = UILabel(
        text: "Закрепление",
        font: UIFont.book(36),
        alignment: .center
    )
    
    let footerLabel = UILabel(
        text: "Изучите слова или нажмите «пропустить», чтобы начать обучение",
        color: UIColor(rgb: 0x9B9B9B),
        font: UIFont.book(20),
        alignment: .center
    )
    
    let returnButton = StartReturnButton()
    
    let cardsView = CardsView()
    
    let buttonsContainer = UIView()
    
    let backButton = BackButton()
    
    let passButton = StartPassButton()
    
    let startButton = StartButton()
    
    let cardsViewHeight = 414 * Screen.heightCoef + 40
    var delegate: StartViewDelegate!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        setupViews()
    }

}
