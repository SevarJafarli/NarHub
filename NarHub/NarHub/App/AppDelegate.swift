//
//  AppDelegate.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 23.01.24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        App.router.start()
          
           
        return true
    }
    
    
}

