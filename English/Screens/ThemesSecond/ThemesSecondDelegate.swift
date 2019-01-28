//
//  ThemesSecondDelegate.swift
//  English
//
//  Created by Сергей Гаврилко on 27/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

extension ThemesSecondView: SingleThemeViewDelegate { }

extension ThemesSecondView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openSingle(theme: themes[indexPath.row])
    }

}

extension ThemesSecondView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return themes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThemesSecondCell", for: indexPath) as! ThemesSecondCell
        cell.sourceItem = themes[indexPath.row]
        return cell
    }
    
}
