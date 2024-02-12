//
//  AppRouter.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 23.01.24.
//

import UIKit


final class AppRouter {
    let window: UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() {
        self.main()

    }

    func main() {
        let viewController = TabBarController()
        TabBarConfigurator.configure(viewController)
        self.window.rootViewController = viewController
        self.window.makeKeyAndVisible()
    }
}


