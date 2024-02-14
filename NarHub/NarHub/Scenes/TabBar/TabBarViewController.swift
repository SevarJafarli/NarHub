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
    
    private lazy var tabbarView : AppTabBar = {
        let view = AppTabBar()
        return view
    }()
    
    private lazy var menuButton: MenuButton = {
        let btn = MenuButton()
        return btn
    }()

    override func loadView() {
        super.loadView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCustomTabBar()
        self.setupUI()
        self.addSubviews()
        self.addConstraints()
        self.addControllers()
    }
    
    
    private func addSubviews() {
        self.tabBar.addSubview(self.menuButton)
    }
    
    private func addConstraints() {
        self.menuButton.snp.updateConstraints { make in
            make.width.height.equalTo(58)
            make.bottom.equalToSuperview().offset(-50)
            make.centerX.equalToSuperview()
        }
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
    
    private func setupUI() {
        self.view.backgroundColor = adaptiveColor(.bgColor)
    }
    
    private func setupCustomTabBar() {
        self.setValue(tabbarView, forKey: "tabBar")
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

