////
////  ChoosingDelegate.swift
////  English
////
////  Created by Сергей Гаврилко on 27/12/2018.
////  Copyright © 2018 gavrilko. All rights reserved.
////
//
//import UIKit
//
//extension ChoosingView: ResultViewDelegate {
//    
//}
//
//extension ChoosingView: UICollectionViewDelegateFlowLayout {
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return cellSize
//    }
//    
//}
//
//extension ChoosingView: UICollectionViewDelegate {
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath) as! ChoosingCell
//        
//        if vm.compareWords(index: indexPath.row) {
//            cell.draw(color: CellColors.green)
//            
//            Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(finishStep), userInfo: nil, repeats: false)
//        } else {
//            cell.draw(color: CellColors.red)
//            cell.showContinueView()
//            
//            let trueCell = collectionView.cellForItem(at: IndexPath(row: vm.findTrueIndex(), section: 0)) as! ChoosingCell
//            trueCell.draw(color: CellColors.green)
//            showNextStepButton()
//        }
//    }
//    
//}
//
//extension ChoosingView: UICollectionViewDataSource {
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 4
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChoosingCell", for: indexPath) as! ChoosingCell
//        cell.sourceItem = vm.getChooseItem().supportWords[indexPath.row]
//        return cell
//    }
//    
//}
