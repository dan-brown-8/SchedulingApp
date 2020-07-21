//
//  AppDelegate.swift
//  SchedulingApp
//
//  Created by Dan Brown on 7/19/20.
//  Copyright © 2020 Dan Brown. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
      //  UINavigationBar.appearance().barTintColor = UIColor(red: 83.0/255.0, green: 161.0/255.0, blue: 232.0/255.0, alpha: 1.0)
        UINavigationBar.appearance().barTintColor = UIColor(red: 0.0/255.0, green: 122.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font : UIFont(name:"Palatino",size:25)!, NSAttributedString.Key.foregroundColor : UIColor.black]
        UINavigationBar.appearance().tintColor = .white

        // Creates the black border underneath the navigation bar
        // Remove the background color.
      //  UINavigationBar.appearance().setBackgroundImage(UIColor.clear.asOneByOneImage(), for: .default)
        // Set the shadow color.
      //  UINavigationBar.appearance().shadowImage = UIColor.black.asOneByOneImage()
        
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

