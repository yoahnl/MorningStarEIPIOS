//
//  LoginAction.swift
//  MorningStar
//
//  Created by Yoahn Linard on 15/02/2020.
//  Copyright © 2020 Yoahn Linard. All rights reserved.
//

import UIKit
import Parse

class LoginActionViewController: UIViewController
{

    @IBOutlet weak var loginButton      : UIButton!
    @IBOutlet weak var emailTextLabel   : LoginTextField!
    @IBOutlet weak var passwordTextLabel: LoginTextField!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.5)
    }
    
    @IBAction func loginAction(_ sender: Any)
    {
        let username: String = emailTextLabel.text!
        let password: String = passwordTextLabel.text!
        PFUser.logInWithUsername(inBackground: username, password: password)
        { (user, error) in
            if ((user) != nil)
            {
                self.performSegue(withIdentifier: "toHome", sender: self)
            }
            else
            {
                let alert = UIAlertController(title: "Oups !", message: "Il y a une erreur !", preferredStyle: .alert)
                self.present(alert, animated: true) {
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    


}
