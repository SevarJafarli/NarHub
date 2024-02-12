//
//  TabBarModels.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 23.01.24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum TabBar {
    // MARK: Use cases
    
    enum Something {
        struct Request { }
        
        struct Response { }
        
        struct ViewModel { }
    }
}

//MARK: TabbarModels

enum TabBarModels {
    case dashboard
    case internet
    case programs
    case support
    case account
}

extension TabBarModels {
    ///title for tabbar item
    var tabbarItemTitle: String? {
        switch self {
        case .dashboard:
            return "Əsas"
        case .internet:
            return "İnternet"
        case .programs:
            return nil
        case .support:
            return "Dəstək"
        case .account:
            return "Hesabım"
        }
    }
    ///icon for tabbar item
    var tabbarItemImage: UIImage? {
        switch self {
        case .dashboard:
            return UIImage(named: AppAssets.main.rawValue)
        case .internet:
            return UIImage(named: AppAssets.internet.rawValue)
        case .programs:
            return nil
        case .support:
            return UIImage(named: AppAssets.support.rawValue)
        case .account:
            return UIImage(named: AppAssets.account.rawValue)
        }
    }
}