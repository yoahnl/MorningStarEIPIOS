//
//  AppDelegate.swift
//  MorningStar
//
//  Created by Yoahn Linard on 28/11/2019.
//  Copyright © 2019 Yoahn Linard. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        let parseConfig = ParseClientConfiguration {
            $0.applicationId = "6EyKIqnLyRI68clY6MEIxQoggUjNjDQX9Y7jUINT"
            $0.clientKey = "p4mEcrk8KD0stEYY7a3sZuTjETYYDNgUJjjfnUXQ"
            $0.server = "https://pg-app-m4qwlp1tlvu6py1yz2sixsx7cddqee.scalabl.cloud/1/"
        }
        Parse.initialize(with: parseConfig)
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

