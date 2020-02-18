//
//  CreateNewSeanceViewController.swift
//  MorningStar
//
//  Created by Guillaume Djaider Fornari on 11/12/2019.
//  Copyright © 2019 Yoahn Linard. All rights reserved.
//

import UIKit


class CreateNewSeanceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonNewSeance(_ sender: Any) {
    }
    
    @IBAction func buttonNewPersonalizeSeance(_ sender: Any) {
        performSegue(withIdentifier: "toSeance", sender: self)
    }
    
}
