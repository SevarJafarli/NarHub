//
//  UserContactsRouter.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 30.01.24.
//

import UIKit

@objc protocol UserContactsRoutingLogic {
    
    func dismissAndRouteToFreeSMS()
}

protocol UserContactsDataPassing {
    var dataStore: UserContactsDataStore? { get }
}

final class UserContactsRouter: NSObject, UserContactsRoutingLogic, UserContactsDataPassing {
    
    func dismissAndRouteToFreeSMS() {
        self.backToFreeSMS(source: viewController!)
        
        let destinationVC = FreeSMSViewController()
        FreeSMSConfigurator.configure(destinationVC)
        
        var destinationDS = destinationVC.router!.dataStore!

    }
    
    func dismissAndRouteToBalanceTransfer() {
        self.backToBalanceTransfer(source: viewController!)
        
        let destinationVC = BalanceTransferViewController()
        BalanceTransferConfigurator.configure(destinationVC)
        
        var destinationDS = destinationVC.router!.dataStore!

    }
    
    
    weak var viewController: UserContactsViewController?
    var dataStore: UserContactsDataStore?
    
    // MARK: Navigation
    
    func backToFreeSMS(source: UserContactsViewController) {
        source.dismiss(animated: true)
    }
    func backToBalanceTransfer(source: UserContactsViewController) {
        source.dismiss(animated: true)
    }
    
}
   
