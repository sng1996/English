//
//  TabBarButtonType.swift
//  English
//
//  Created by Сергей Гаврилко on 24/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

enum TabBarButtonType {
    static let inbox = ImageItem(
        image: UIImage(named: "Inbox_gray")!,
        activatedImage: UIImage(named: "Inbox_green")!,
        size: CGSize(width: 20, height: 20)
    )
    static let repeats = ImageItem(
        image: UIImage(named: "Repeats_gray")!,
        activatedImage: UIImage(named: "Repeats_green")!,
        size: CGSize(width: 18, height: 20)
    )
    static let modules = ImageItem(
        image: UIImage(named: "Modules_gray")!,
        activatedImage: UIImage(named: "Modules_green")!,
        size: CGSize(width: 20, height: 20)
    )
    static let settings = ImageItem(
        image: UIImage(named: "Settings_gray")!,
        activatedImage: UIImage(named: "Settings_green")!,
        size: CGSize(width: 20, height: 20)
    )
    static let themes = ImageItem(
        image: UIImage(named: "Themes_gray")!,
        activatedImage: UIImage(named: "Themes_green")!,
        size: CGSize(width: 20, height: 20)
    )
    static let prose = ImageItem(
        image: UIImage(named: "Prose_gray")!,
        activatedImage: UIImage(named: "Prose_green")!,
        size: CGSize(width: 20, height: 20)
    )
    static let thousands = ImageItem(
        image: UIImage(named: "Lyric_gray")!,
        activatedImage: UIImage(named: "Lyric_green")!,
        size: CGSize(width: 20, height: 20)
    )
}
