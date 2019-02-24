//
//  CardsView.swift
//  English
//
//  Created by Сергей Гаврилко on 26/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

enum Side {
    case left, right
}

protocol CardsViewDelegate {
    func showReturnButton()
    func hideReturnButton()
    func showStartButton()
    func numberOfItems() -> Int
    func itemAt(_ index: Int) -> CardViewDataModel
}

class CardsView: UIView {
    
    var cards: [CardView] = []
    var removedCards: [CardView] = []
    
    var delegate: CardsViewDelegate!
    
    var cardSize: CGSize!
    var cardY: CGFloat!
    var secondCardScale: CGFloat!
    var thirdCardScale: CGFloat!
    
    let screenHalfWidth = Screen.width / 2
    let screenHalfHeight = Screen.height / 2
    let thirdPart = Screen.width / 3
    let secondThirdPart = 2 * Screen.width / 3
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
    }
    
    func reloadData() {
        setupViews()
        
        cardSize = cards[0].frame.size
        cardY = cards[0].frame.origin.y
        secondCardScale = (cardSize.width - 40) / cardSize.width
        thirdCardScale = (cardSize.width - 80) / cardSize.width
    }
    
    func setupViews() {
        cards.removeAll()
        removedCards.removeAll()
        
        let count = delegate.numberOfItems()
        
        for i in 0..<count {
            let card = CardView()
            card.sourceItem = delegate.itemAt(i)
            if i < count - 1 {
                card.addGestureRecognizer(
                    UIPanGestureRecognizer(
                        target: self,
                        action: #selector(handlePanGesture(_:))
                    )
                )
            }
            cards.append(card)
        }
        
        if cards.count > 0 {
            cards[0].center.x = Screen.width / 2
            cards[0].frame.origin.y = 40
            self.addSubview(cards[0])
        }
        
        if cards.count > 1 {
            let scale = (cards[0].frame.width - 40) / cards[0].frame.width
            cards[1].transform = CGAffineTransform(scaleX: scale, y: scale)
            cards[1].center.x = Screen.width / 2
            cards[1].frame.origin.y = cards[0].frame.minY - 20
            self.insertSubview(cards[1], belowSubview: cards[0])
        }
        
        if cards.count > 2 {
            let scale = (cards[0].frame.width - 80) / cards[0].frame.width
            cards[2].transform = CGAffineTransform(scaleX: scale, y: scale)
            cards[2].center.x = Screen.width / 2
            cards[2].frame.origin.y = cards[1].frame.minY - 20
            self.insertSubview(cards[2], belowSubview: cards[1])
        }
    }
    
    
    @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        switch(gesture.state) {
        case UIGestureRecognizer.State.began:
            if cards.count > 3 {
                setFourthCard()
            }
            break
            
        case UIGestureRecognizer.State.changed:
            if cards.count == 0 { return }
            
            let translation = gesture.translation(in: self)
            let locationOnCard = gesture.location(in: cards[0])
            
            moveCard(translation)
            rotateCard(translation, locationOnCard)
            
            gesture.setTranslation(CGPoint.zero, in: self)
            
            if cards.count > 1 {
                moveSecondCard()
            }
            
            if cards.count > 2 {
                moveThirdCard()
            }
            
            break
            
        case UIGestureRecognizer.State.ended:
            if cards.count == 0 { return }
            
            let cardCenterX = cards[0].center.x
            
            if cardCenterX > secondThirdPart {
                didThrowCard(to: .right)
            } else if cardCenterX < thirdPart {
                didThrowCard(to: .left)
            } else {
                animateBack(card: cards[0])
                restCardsBackAnimation()
            }
            
            break
            
        default: break
        }
        
    }
    
    func setFourthCard() {
        cards[3].transform = CGAffineTransform(scaleX: thirdCardScale, y: thirdCardScale)
        cards[3].center.x = self.frame.width / 2
        cards[3].frame.origin.y = cardY - 40
        self.insertSubview(cards[3], belowSubview: cards[2])
    }
    
    func moveSecondCard() {
        let scale = (abs(screenHalfWidth - cards[0].center.x) / screenHalfWidth) / 10 + secondCardScale
        cards[1].transform = CGAffineTransform.identity
        cards[1].transform = CGAffineTransform(scaleX: scale, y: scale)
        cards[1].frame.origin.y = cardY - 20 + (abs(screenHalfWidth - cards[0].center.x) / screenHalfWidth) * 20
    }
    
    func moveThirdCard() {
        let scale = (abs(screenHalfWidth - cards[0].center.x) / screenHalfWidth) / 10 + thirdCardScale
        cards[2].transform = CGAffineTransform.identity
        cards[2].transform = CGAffineTransform(scaleX: scale, y: scale)
        cards[2].frame.origin.y = cardY - 40 + (abs(screenHalfWidth - cards[0].center.x) / screenHalfWidth) * 20
    }
    
    func restCardsFinishAnimation() {
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveLinear, animations: {
            if self.cards.count > 0 {
                self.cards[0].transform = CGAffineTransform.identity
                self.cards[0].frame.origin.y = self.cardY
            }
            if self.cards.count > 1 {
                self.cards[1].transform = CGAffineTransform.identity
                self.cards[1].transform = CGAffineTransform(scaleX: self.secondCardScale, y: self.secondCardScale)
                self.cards[1].frame.origin.y = self.cardY - 20
            }
        }, completion: { finished in
        })
    }
    
    func restCardsBackAnimation() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveLinear, animations: {
            if self.cards.count > 1 {
                self.cards[1].transform = CGAffineTransform.identity
                self.cards[1].transform = CGAffineTransform(scaleX: self.secondCardScale, y: self.secondCardScale)
                self.cards[1].frame.origin.y = self.cardY - 20
            }
            if self.cards.count > 2 {
                self.cards[2].transform = CGAffineTransform.identity
                self.cards[2].transform = CGAffineTransform(scaleX: self.thirdCardScale, y: self.thirdCardScale)
                self.cards[2].frame.origin.y = self.cardY - 40
            }
        }, completion: { finished in
            if self.cards.count > 3 {
                self.cards[3].removeFromSuperview()
                self.cards[3].transform = CGAffineTransform.identity
            }
        })
    }
    
    func moveCard(_ translation: CGPoint) {
        cards[0].center = CGPoint(
            x: cards[0].center.x + translation.x,
            y: cards[0].center.y + translation.y
        )
    }
    
    func rotateCard(_ translation: CGPoint, _ locationOnCard: CGPoint) {
        let sign: CGFloat = locationOnCard.y > cardSize.height / 2 ? -1 : 1
        let angleDelta = (.pi / 2500) * translation.x * sign
        
        cards[0].transform = cards[0].transform.rotated(by: angleDelta)
    }
    
    func moveCardTo(_ side: Side, card: CardView) {
        if side == .left {
            card.center.x = -cardSize.width
        } else {
            card.center.x = cardSize.width + self.frame.width
        }
    }
    
    func setOrigin(_ view: CardView?) {
        if view != nil {
            view!.frame.origin.y = cardY
            view!.center.x = screenHalfWidth
            view!.frame.size = cardSize
        }
    }
    
    func removeFromArray() {
        let card = cards.removeFirst()
        removedCards.append(card)
    }
    
    func rotateBack(card: CardView) {
        card.transform = CGAffineTransform.identity
    }
    
    func animateTo(_ side: Side, card: CardView) {
        self.removeFromArray()
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveLinear, animations: {
            self.moveCardTo(side, card: card)
        }, completion: { finished in
            card.isHidden = true
        })
    }
    
    func animateBack(card: CardView) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveLinear, animations: {
            self.rotateBack(card: card)
            self.setOrigin(card)
        }, completion: { finished in
        })
    }
    
    func didThrowCard(to: Side) {
        if removedCards.isEmpty {
            delegate.showReturnButton()
        }
        
        if cards.count == 2 {
            delegate.showStartButton()
        }
        
        animateTo(to, card: cards[0])
        restCardsFinishAnimation()
    }
    
    func returnCard() {
        if removedCards.count == 1 {
            delegate.hideReturnButton()
        }
        let card = removedCards.removeLast()
        cards.insert(card, at: 0)
        card.isHidden = false
        animateBack(card: card)
        restCardsBackAnimation()
    }

}
