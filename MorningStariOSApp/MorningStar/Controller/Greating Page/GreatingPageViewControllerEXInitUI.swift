//
//  LoginPageViewControllerEXInitUI.swift
//  MorningStar
//
//  Created by Yoahn Linard on 28/11/2019.
//  Copyright © 2019 Yoahn Linard. All rights reserved.
//

import UIKit
import AuthenticationServices
import SnapKit
import SwiftSVG

extension GreatingPageViewController
{
    
    func initLoginBG()
    {
        self.loginBGUIImageView.alpha = 0.8
    }
    
    
    func initLoginFormBGUIView()
    {
        self.loginFormBGUIView.layer.cornerRadius = 20
    }
    
    func initSignWithAppleButton()
    {
        self.signWithAppleButton = ASAuthorizationAppleIDButton(type: .signIn, style: .whiteOutline)
        self.signWithAppleButton.addTarget(self, action: #selector(self.signInWithApple), for: .touchUpInside)
        self.loginFormBGUIView.addSubview(self.signWithAppleButton)
        self.signWithAppleButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
    }
    
    func initOrLabel()
    {
        self.orLabel = UILabel()
        self.orLabel.text = "Or"
        
        self.orLabel.textAlignment = .center
        self.loginFormBGUIView.addSubview(self.orLabel)
        self.orLabel.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.signWithAppleButton.snp.bottom).offset(30)
        }
    }
    
    func initOtherSignInOptionsButton()
    {
        self.otherSignInOptionsButton = UIButton()
        self.otherSignInOptionsButton.setTitle("View Other Sign in options", for: .normal)
        self.otherSignInOptionsButton.titleLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.otherSignInOptionsButton.titleLabel?.textAlignment = .center
        self.otherSignInOptionsButton.underline()
        self.otherSignInOptionsButton.addTarget(self, action: #selector(self.toOtherSignInOption), for: .touchUpInside)
        
        self.loginFormBGUIView.addSubview(self.otherSignInOptionsButton)
        self.otherSignInOptionsButton.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.orLabel.snp.bottom).offset(50)
        }
        
    }
    
    func initSignInWithFacebookButton()
    {
        self.signInWithFacebookButton = UIButton()
        self.signInWithFacebookButton.setImage(#imageLiteral(resourceName: "facebook"), for: .normal)
        
        self.loginFormBGUIView.addSubview(self.signInWithFacebookButton)
        
        self.signInWithFacebookButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(55)
            make.width.equalToSuperview().inset(45)
        }
        self.signInWithFacebookButton.isHidden = true
    }
    
    func initSignInWithGoogleButton()
    {
        self.signInWithGoogleButton = UIButton()
        self.signInWithGoogleButton.setImage(#imageLiteral(resourceName: "google"), for: .normal)
        
        self.loginFormBGUIView.addSubview(self.signInWithGoogleButton)
        
        self.signInWithGoogleButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.signInWithFacebookButton.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.height.equalTo(55)
            make.width.equalToSuperview().inset(45)
        }
        self.signInWithGoogleButton.isHidden = true
    }
    
    func initSignInWithEmailButton()
    {
        self.signInWithEmailButton = UIButton()
        self.signInWithEmailButton.setImage(#imageLiteral(resourceName: "signWithEmailButton"), for: .normal)
        
        self.loginFormBGUIView.addSubview(self.signInWithEmailButton)
        
        self.signInWithEmailButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.signInWithGoogleButton.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.height.equalTo(55)
            make.width.equalToSuperview().inset(45)
        }
        
        self.signInWithEmailButton.addTarget(self, action: #selector(self.signInWithEmailAndPassword), for: .touchUpInside)
        
        self.signInWithEmailButton.isHidden = true
    }
    
}
