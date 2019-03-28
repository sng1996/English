//
//  ShadowsView.swift
//  English
//
//  Created by Сергей Гаврилко on 13/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ShadowsView: UIView {
    
    var layers: [CALayer] = []

    init() {
        super.init(frame: .zero)
        addObserver(self, forKeyPath: #keyPath(UIView.bounds), options: .new, context: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let objectView = object as? UIView,
            objectView === self,
            keyPath == #keyPath(UIView.bounds) {
            for layer in layers {
                layer.backgroundColor = backgroundColor!.cgColor
                layer.frame = objectView.bounds
            }
        }
    }
    
    func set(shadows: [Shadow]) {
        for index in 0..<shadows.count {
            if index == 0 {
                layer.set(shadow: shadows[index])
            } else {
                let sublayer = CALayer()
                layer.addSublayer(sublayer)
                layers.append(sublayer)
                sublayer.set(shadow: shadows[index])
            }
        }
    }
    
    func set(cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        for layer in layers {
            layer.cornerRadius = cornerRadius
        }
    }

}
