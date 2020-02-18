//
//  ViewController.swift
//  MorningStar
//
//  Created by Yoahn Linard on 28/11/2019.
//  Copyright © 2019 Yoahn Linard. All rights reserved.
//

import UIKit
import AuthenticationServices
import Spring

class GreatingPageViewController: UIViewController
{

    /* StoryBoard element */
    @IBOutlet weak var loginBGUIImageView   : UIImageView!
    @IBOutlet weak var loginFormBGUIView    : SpringView!
    
    
    /* Sign in Button */
    var otherSignInOptionsButton: UIButton!
    var signInWithFacebookButton: UIButton!
    var signInWithGoogleButton  : UIButton!
    var signInWithEmailButton   : UIButton!
    
    var signWithAppleButton     : ASAuthorizationAppleIDButton!
    
    /* UI Element */
    var orLabel                 : UILabel!
    
    var isSocial: Bool = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.initLoginBG()
        self.initLoginFormBGUIView()
        self.initSignWithAppleButton()
        self.initOrLabel()
        self.initOtherSignInOptionsButton()
        self.initSignInWithFacebookButton()
        self.initSignInWithGoogleButton()
        self.initSignInWithEmailButton()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        self.isUserConnected()
    }

    @objc func toOtherSignInOption()
    {
        
        var animationName: String = ""
        
        if self.isSocial
        {
            animationName = "fadeInRight"
        }
        else if !self.isSocial
        {
            animationName = "fadeInLeft"
        }
        
        self.loginFormBGUIView.animation = animationName
        self.loginFormBGUIView.animate()
        if self.isSocial
        {
            self.otherSignInOptionsButton.isHidden = false
            self.otherSignInOptionsButton.setTitle("View Other Sign in options", for: .normal)
            self.signWithAppleButton.isHidden = false
            self.orLabel.isHidden = false
            self.signInWithFacebookButton.isHidden = true
            self.signInWithGoogleButton.isHidden = true
            self.signInWithEmailButton.isHidden = true

        }
        else if !self.isSocial
        {
            self.otherSignInOptionsButton.isHidden = false
            self.otherSignInOptionsButton.setTitle("Back", for: .normal)
            self.signInWithFacebookButton.isHidden = false
            self.signInWithGoogleButton.isHidden = false
            self.signInWithEmailButton.isHidden = false
            self.signWithAppleButton.isHidden = true
            self.orLabel.isHidden = true
        }
        self.isSocial = !self.isSocial
    }
    
}

