//
//  LoaderView.swift
//  English
//
//  Created by Сергей Гаврилко on 08/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class LoaderView: UIView {
    
    let time: Double = 0.5
    let distance: CGFloat = 5.0
    
    var round: RoundView {
        let view = RoundView()
        view.backgroundColor = UIColor(rgb: 0x68DBA5)
        view.alpha = 0.0
        return view
    }
    
    var round1: RoundView!
    var round2: RoundView!
    var round3: RoundView!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        setupViews()
        startAnimation()
    }
    
    func setupViews() {
        round1 = round
        round2 = round
        round3 = round
        
        addSubview(round1)
        addSubview(round2)
        addSubview(round3)
        
        addConstraintsWithFormat(format: "H:|[v0]-\(distance)-[v1]-\(distance)-[v2]|", views: round1, round2, round3)
        addConstraintsWithFormat(format: "V:|[v0]|", views: round1)
        addConstraintsWithFormat(format: "V:|[v0]|", views: round2)
        addConstraintsWithFormat(format: "V:|[v0]|", views: round3)
    }
    
    func startAnimation() {
        Timer.scheduledTimer(timeInterval: 0.0, target: self, selector: #selector(firstRound), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: time / 2, target: self, selector: #selector(secondRound), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: time, target: self, selector: #selector(thirdRound), userInfo: nil, repeats: false)
    }
    
    @objc func firstRound() {
        UIView.animate(withDuration: time, delay: 0, options: .curveLinear, animations: {
            self.round1.alpha = 1.0
        }, completion: { finished in
            UIView.animate(withDuration: self.time, delay: 0, options: .curveLinear, animations: {
                self.round1.alpha = 0.0
            }, completion: { finished in
                self.firstRound()
            })
        })
    }
    
    @objc func secondRound() {
        UIView.animate(withDuration: time, delay: 0, options: .curveLinear, animations: {
            self.round2.alpha = 1.0
        }, completion: { finished in
            UIView.animate(withDuration: self.time, delay: 0, options: .curveLinear, animations: {
                self.round2.alpha = 0.0
            }, completion: { finished in
                self.secondRound()
            })
        })
    }
    
    @objc func thirdRound() {
        UIView.animate(withDuration: time, delay: 0, options: .curveLinear, animations: {
            self.round3.alpha = 1.0
        }, completion: { finished in
            UIView.animate(withDuration: self.time, delay: 0, options: .curveLinear, animations: {
                self.round3.alpha = 0.0
            }, completion: { finished in
                self.thirdRound()
            })
        })
    }
    
}

