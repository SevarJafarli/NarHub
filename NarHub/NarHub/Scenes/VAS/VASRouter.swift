//
//  VASRouter.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 31.01.24.
//

import UIKit

@objc protocol VASRoutingLogic {
    
    //func routeToSomewhere()
}

protocol VASDataPassing {
    var dataStore: VASDataStore? { get }
}

final class VASRouter: NSObject, VASRoutingLogic, VASDataPassing {
    
    weak var viewController: VASViewController?
    var dataStore: VASDataStore?
}
