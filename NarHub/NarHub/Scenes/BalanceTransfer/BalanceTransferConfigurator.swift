//
//  BalanceTransferConfigurator.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 26.01.24.
//

import UIKit

final class BalanceTransferConfigurator {
    
    @discardableResult
    static func configure(_ viewController: BalanceTransferViewController) -> BalanceTransferViewController {
        let view = BalanceTransferView()
        let interactor = BalanceTransferInteractor()
        let presenter = BalanceTransferPresenter()
        let router = BalanceTransferRouter()
        
        viewController.mainView = view
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        
        router.viewController = viewController
        router.dataStore = interactor
        
        return viewController
    }
}
