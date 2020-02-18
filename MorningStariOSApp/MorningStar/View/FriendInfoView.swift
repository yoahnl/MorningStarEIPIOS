//
//  FriendInfoView.swift
//  MorningStar
//
//  Created by Guillaume Djaider Fornari on 07/12/2019.
//  Copyright © 2019 Yoahn Linard. All rights reserved.
//

import UIKit

class FriendInfoView: UIView {

    @IBOutlet weak var imageFriend: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelConnected: UILabel!
    
    func setFriendInfoView(friend: (String, UIImage, Bool)) {
        if (friend.2) {
            self.labelConnected.text = "Connected"
        }
        else {
            self.labelConnected.text = "Not Connected"
        }
        self.labelName.text = friend.0
        self.imageFriend.image = friend.1
    }
}
