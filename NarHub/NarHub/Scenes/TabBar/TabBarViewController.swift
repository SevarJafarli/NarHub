//
//  TabBarViewController.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 23.01.24.


import UIKit
import NarHubUIKit

protocol TabBarDisplayLogic: AnyObject {
    func displaySomething(viewModel: TabBar.Something.ViewModel)
}

final class TabBarController: UITabBarController, ThemeableViewController {
    var interactor: TabBarBusinessLogic?
    var router: (NSObjectProtocol & TabBarRoutingLogic & TabBarDataPassing)?
    
    
    var theme: ThemeProvider = App.theme
    
    private var middleButton: RoundedButton?
    
    override func loadView() {
        super.loadView()
        self.middleButton = RoundedButton(frame: CGRect(x: Int(self.tabBar.bounds.width)/2 - 30, y: -30, width: 60, height: 60))
        self.setupMiddleButton()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Ensure the middle button is centered and positioned above the tab bar
        self.middleButton!.center = CGPoint(x: tabBar.center.x, y: tabBar.bounds.minY - self.middleButton!.bounds.height / 6 + 10)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCustomTabBar()
        self.addControllers()
    }
    
    fileprivate func setupMiddleButton() {
        self.tabBar.addSubview(self.middleButton!)
        self.tabBar.bringSubviewToFront(self.middleButton!)
    }

    private func addControllers() {
        let dashboardVC = DashboardViewController()
        let dashboardView = MainNavigation(rootViewController: DashboardConfigurator.configure(dashboardVC))
        dashboardView.tabBarItem = UITabBarItem()
        dashboardView.tabBarItem.title = TabBarModels.dashboard.tabbarItemTitle
        dashboardView.tabBarItem.image = TabBarModels.dashboard.tabbarItemImage
        
        let internetVC = UIViewController()
        let internetView = MainNavigation(rootViewController: internetVC)
        internetView.tabBarItem = UITabBarItem()
        internetView.tabBarItem.title = TabBarModels.internet.tabbarItemTitle
        internetView.tabBarItem.image = TabBarModels.internet.tabbarItemImage
        
        let supportVC = UIViewController()
        let supportView = MainNavigation(rootViewController: supportVC)
        supportView.tabBarItem = UITabBarItem()
        supportView.tabBarItem.title = TabBarModels.support.tabbarItemTitle
        supportView.tabBarItem.image = TabBarModels.support.tabbarItemImage
        
        let accountVC = UIViewController()
        let accountView = MainNavigation(rootViewController: accountVC)
        accountView.tabBarItem = UITabBarItem()
        accountView.tabBarItem.title = TabBarModels.account.tabbarItemTitle
        accountView.tabBarItem.image = TabBarModels.account.tabbarItemImage
  
        let dummyVC = UIViewController()
        let dummyView = MainNavigation(rootViewController: dummyVC)
        
        let controllers = [dashboardView, internetView, dummyView, supportView, accountView]
        self.viewControllers = controllers
    }
    
    private func setupCustomTabBar() {
        let tabbarView = TabBarView()
        let shape = tabbarView.setupCustomTabBar(width: Int(self.tabBar.bounds.width), height: Int(self.tabBar.bounds.height))
        
        self.tabBar.layer.insertSublayer(shape, at: 0)
        self.tabBar.tintColor = adaptiveColor(.mainColor)
        self.tabBar.unselectedItemTintColor = adaptiveColor(.labelColor)
        self.tabBar.backgroundColor = .clear
        self.tabBar.isTranslucent = false
        self.tabBar.barTintColor = .white

        self.view.backgroundColor = adaptiveColor(.bgColor)
    }
    
    func doSomething() {
        let request = TabBar.Something.Request()
        interactor?.doSomething(request: request)
    }
}

//MARK: UITabBarControllerDelegate

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return tabBarController.selectedIndex != 2
    }
}



extension TabBarController: TabBarDisplayLogic {
    func displaySomething(viewModel: TabBar.Something.ViewModel) {
    }
}
