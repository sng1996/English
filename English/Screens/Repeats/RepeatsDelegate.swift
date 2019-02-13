//
//  RepeatsDelegate.swift
//  English
//
//  Created by Сергей Гаврилко on 28/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

extension RepeatsView: TranslateViewDelegate { }
extension RepeatsView: StartViewDelegate { }
extension RepeatsView: ChoosingViewDelegate { }
extension RepeatsView: SpellingViewDelegate { }

extension RepeatsView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let wordData = wordDataService.repeatWords[indexPath.row]
        translateView.open(wordData)
        
        scrollView.isScrollEnabled = false
        cellsToGray()
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.scrollView.backgroundColor = UIColor(rgb: 0xF3F3F3)
        }, completion: nil)
        
        let cell = tv.cellForRow(at: indexPath) as! RepeatsCell
        cell.activate()
    }
    
}

extension RepeatsView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordDataService.repeatWords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepeatsCell", for: indexPath) as! RepeatsCell
        let word = wordDataService.repeatWords[indexPath.row]
        cell.sourceItem = word
        
        if indexPath.row >= wordDataService.todayCount {
            cell.deactivate()
        } else {
            cell.activate()
        }
        
        tvHeightAnchor.constant = tv.contentSize.height + 10
        layoutIfNeeded()
        return cell
    }
    
}
