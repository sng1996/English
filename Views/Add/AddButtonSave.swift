//
//  AddButtonSave.swift
//  English
//
//  Created by Сергей Гаврилко on 24/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

enum SaveButtonMode {
    case arrow, loader, save
}

class AddButtonSave: Button {
    
    let arrowImageView = ImageView(name: "RightArrow_green")
    let saveImageView = ImageView(name: "Save_green")
    var loader: LoaderView?
    
    let arrowSize = CGSize(width: 6.6, height: 12)
    let saveSize = CGSize(width: 13.3, height: 9)
    let loaderSize = CGSize(width: 22, height: 4)
    
    var arrowWidthConstraint: NSLayoutConstraint!
    var arrowHeightConstraint: NSLayoutConstraint!
    var saveWidthConstraint: NSLayoutConstraint!
    var saveHeightConstraint: NSLayoutConstraint!
    var loaderWidthConstraint: NSLayoutConstraint!
    var loaderHeightConstraint: NSLayoutConstraint!
    
    let line: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(rgb: 0xF9F9F9)
        return view
    }()
    
    var currentMode: SaveButtonMode = .arrow {
        didSet {
            switch currentMode {
            case .arrow:
                hideLoader()
                hideSave()
                animateLayout(complete: {
                    if let loader = self.loader {
                        loader.removeFromSuperview()
                    }
                    self.showArrow()
                    self.animateLayout()
                })
                break
            case .loader:
                hideArrow()
                hideSave()
                animateLayout(complete: {
                    self.showLoader()
                    self.animateLayout()
                })
                break
            case .save:
                hideLoader()
                hideArrow()
                animateLayout(complete: {
                    if let loader = self.loader {
                        loader.removeFromSuperview()
                    }
                    self.showSave()
                    self.animateLayout()
                })
                break
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init() {
        super.init()
        setupViews()
    }
    
    private func setupViews() {
        addSubview(arrowImageView)
        addSubview(saveImageView)
        addSubview(line)
        
        translatesAutoresizingMaskIntoConstraints = false
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        saveImageView.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        
        arrowWidthConstraint = arrowImageView.widthAnchor.constraint(equalToConstant: arrowSize.width)
        arrowHeightConstraint = arrowImageView.heightAnchor.constraint(equalToConstant: arrowSize.height)
        saveWidthConstraint = saveImageView.widthAnchor.constraint(equalToConstant: 0)
        saveHeightConstraint = saveImageView.heightAnchor.constraint(equalToConstant: 0)
        
        NSLayoutConstraint.activate([
            arrowWidthConstraint,
            arrowHeightConstraint,
            saveWidthConstraint,
            saveHeightConstraint,
            arrowImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            arrowImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            saveImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            saveImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            line.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            line.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            line.widthAnchor.constraint(equalToConstant: 1),
            line.leftAnchor.constraint(equalTo: leftAnchor)
        ])
    }
    
    private func showArrow() {
        arrowWidthConstraint.constant = arrowSize.width
        arrowHeightConstraint.constant = arrowSize.height
    }
    
    private func hideArrow() {
        arrowWidthConstraint.constant = 0
        arrowHeightConstraint.constant = 0
    }
    
    private func showSave() {
        saveWidthConstraint.constant = saveSize.width
        saveHeightConstraint.constant = saveSize.height
    }
    
    private func hideSave() {
        saveWidthConstraint.constant = 0
        saveHeightConstraint.constant = 0
    }
    
    private func showLoader() {
        let loader = LoaderView()
        self.loader = loader
        addSubview(loader)
        
        loader.translatesAutoresizingMaskIntoConstraints = false
        loaderWidthConstraint = loader.widthAnchor.constraint(equalToConstant: 0)
        loaderHeightConstraint = loader.heightAnchor.constraint(equalToConstant: 0)
        loaderWidthConstraint.priority = UILayoutPriority(rawValue: 999)
        loaderHeightConstraint.priority = UILayoutPriority(rawValue: 999)
        
        NSLayoutConstraint.activate([
            loaderWidthConstraint,
            loaderHeightConstraint,
            loader.centerXAnchor.constraint(equalTo: centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        layoutIfNeeded()
        
        loaderWidthConstraint.constant = loaderSize.width
        loaderHeightConstraint.constant = loaderSize.height
    }
    
    private func hideLoader() {
        if loader == nil { return }
        loaderWidthConstraint.constant = 0
        loaderHeightConstraint.constant = 0
    }
    
    private func animateLayout(complete: (() -> ())? = nil) {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.layoutIfNeeded()
        }, completion: { finished in
            if let complete = complete {
                complete()
            }
        })
    }

}
