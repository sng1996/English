//
//  RedViewController.swift
//  English
//
//  Created by Сергей Гаврилко on 05/04/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        
        print("Load red")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Appear red")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("Disappear red")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
