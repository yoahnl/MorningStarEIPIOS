//
//  DashboardFriendsCollectionViewCell.swift
//  MorningStar
//
//  Created by Guillaume Djaider Fornari on 07/12/2019.
//  Copyright © 2019 Yoahn Linard. All rights reserved.
//

import UIKit

class DashboardFriendsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageFriend: UIImageView!
    @IBOutlet weak var viewConnected: UIView!
    @IBOutlet weak var labelName: UILabel!
    
    func setFriendCollection(friend: (String, UIImage, Bool)) {
        if (friend.2) {
            self.viewConnected.backgroundColor = .green
        }
        else {
           self.viewConnected.backgroundColor = .red
        }
        self.labelName.text = friend.0
        self.imageFriend.image = friend.1
    }
}
