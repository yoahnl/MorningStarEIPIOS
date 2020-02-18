//
//  FriendInfoViewController.swift
//  MorningStar
//
//  Created by Guillaume Djaider Fornari on 07/12/2019.
//  Copyright © 2019 Yoahn Linard. All rights reserved.
//

import UIKit

class FriendInfoViewController: UIViewController {

    var information: (String, UIImage, Bool)?
    @IBOutlet var infoFriendView: FriendInfoView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.infoFriendView.setFriendInfoView(friend: information ?? ("NoName", UIImage(named: "user")!, false))
    }

}
