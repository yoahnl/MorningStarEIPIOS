//
//  DashboardViewController.swift
//  MorningStar
//
//  Created by Guillaume Djaider Fornari on 06/12/2019.
//  Copyright © 2019 Yoahn Linard. All rights reserved.
//

import UIKit
import Pastel

class HomePageViewController: UIViewController
{

    @IBOutlet weak var pastelView: UIView!
    
    
    var information: (String, UIImage, Bool)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initPastel()
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    @IBAction func buttonUser(_ sender: Any) {
        performSegue(withIdentifier: "toUser", sender: self)
    }
    
    @IBAction func buttonBadge(_ sender: Any) {
        performSegue(withIdentifier: "toBadge", sender: self)
    }
    
    @IBAction func buttonState(_ sender: Any) {
        performSegue(withIdentifier: "toUserState", sender: self)
    }
    
    @IBAction func buttonInfoUser(_ sender: Any) {
        performSegue(withIdentifier: "toUserInfo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFriendInfo" {
            let successVC = segue.destination as! FriendInfoViewController
            successVC.information = self.information
        }
    }
    
    func initPastel()
    {
        let pastelView = PastelView(frame: self.pastelView.bounds)
        pastelView.startPastelPoint = .left
        pastelView.endPastelPoint = .right
        pastelView.animationDuration = 2.0
        pastelView.setColors([UIColor(hex: "#79EBEE"), UIColor(hex: "#4879BD")])
        pastelView.startAnimation()
        self.pastelView.insertSubview(pastelView, at: 0)
    }
}

extension HomePageViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var friends: [(String, UIImage, Bool)] {
        return  [("Martine", UIImage(named: "friend1")!, true),
                ("Guillaume", UIImage(named: "friend2")!, false),
                ("Yoahn", UIImage(named: "friend3")!, true),
                ("Corinne", UIImage(named: "friend4")!, false),
                ("Titouan", UIImage(named: "friend5")!, false)]
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: DashboardFriendsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "friendCollectionView", for: indexPath) as! DashboardFriendsCollectionViewCell
        cell.setFriendCollection(friend: friends[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 143, height: 152)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.information = friends[indexPath.row]
        self.performSegue(withIdentifier: "toFriendInfo", sender: self)
    }
}
