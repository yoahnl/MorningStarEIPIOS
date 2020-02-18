//
//  ChatCollectionViewCell.swift
//  MorningStar
//
//  Created by Guillaume Djaider Fornari on 12/12/2019.
//  Copyright © 2019 Yoahn Linard. All rights reserved.
//

import UIKit

class ChatCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var choice: UILabel!
    
    func setChoice(choice: String) {
        self.choice.text = choice
    }
}
