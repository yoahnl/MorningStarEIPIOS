//
//  LoginPageViewControllerEXLoginFunction.swift
//  MorningStar
//
//  Created by Yoahn Linard on 03/12/2019.
//  Copyright © 2019 Yoahn Linard. All rights reserved.
//

import UIKit
import AuthenticationServices
import Parse

extension GreatingPageViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding
{
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor
    {
        return self.view.window!
    }
    
    
    @objc func signInWithApple()
    {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.email, .fullName]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
        
    }
    
    @objc func signInWithEmailAndPassword()
    {
        let controller = storyboard?.instantiateViewController(withIdentifier: "LoginActionViewController") as! LoginActionViewController
        self.present(controller, animated: true, completion: nil)
    }
    
    
    func isUserConnected()
    {
        let currentUser = PFUser.current()
        if currentUser != nil
        {
            print(currentUser!)
            let alert = UIAlertController(title: "User", message: "The user is connected", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            //self.present(alert, animated: true, completion: nil)
            self.performSegue(withIdentifier: "toHome", sender: self)
           // self.performSegue(withIdentifier: "toHome", sender: self)
        }
    }
}
