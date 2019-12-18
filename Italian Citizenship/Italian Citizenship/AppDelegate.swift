//
//  AppDelegate.swift
//  Italian Citizenship
//
//  Created by Cameron Nottingham on 12/10/19.
//  Copyright © 2019 Cameron Nottingham. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var coordinator: MainCoordinator?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let navController = UINavigationController()

        // send that into our coordinator so that it can display view controllers
        coordinator = MainCoordinator(navigationController: navController)

        // tell the coordinator to take over control
        coordinator?.start(firstTime: isFirstLaunch())

        // create a basic UIWindow and activate it
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    
    //Determines whether the app has launched before

    func isFirstLaunch()->Bool{
        let defaults = UserDefaults.standard

        if let isAppAlreadyLaunchedOnce = defaults.string(forKey: "isAppAlreadyLaunchedOnce"){
            print("App already launched : \(isAppAlreadyLaunchedOnce)")
            return false
        }else{
            defaults.set(true, forKey: "isAppAlreadyLaunchedOnce")
            print("App launched first time")
            return true
        }
    }
}

