//
//  BalanceTransferRouter.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 26.01.24.
//

import UIKit

@objc protocol BalanceTransferRoutingLogic {
    
    func routeToContacts()
}

protocol BalanceTransferDataPassing {
    var dataStore: BalanceTransferDataStore? { get }
}

final class BalanceTransferRouter: NSObject, BalanceTransferRoutingLogic, BalanceTransferDataPassing {
    
    weak var viewController: BalanceTransferViewController?
    var dataStore: BalanceTransferDataStore?
  
    func routeToContacts() {
        let destinationVC = UserContactsViewController()
        UserContactsConfigurator.configure(destinationVC)
        destinationVC.delegate = viewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToContacts(source: dataStore!, destination: &destinationDS)
        
        navigateToContacts(source: viewController!, destination: destinationVC)
    }
    
    func navigateToContacts(source: BalanceTransferViewController, destination: UserContactsViewController) {
        source.showDetailViewController(destination, sender: nil)
    }
    
    
    // MARK: Passing data to contacts
    
    func passDataToContacts(source: BalanceTransferDataStore, destination: inout UserContactsDataStore) {
        //        destination.name = source.name
    }
}
