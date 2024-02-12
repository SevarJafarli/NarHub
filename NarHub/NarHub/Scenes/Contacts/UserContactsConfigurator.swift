//
//  UserContactsConfigurator.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 30.01.24.
//

import UIKit

final class UserContactsConfigurator {
    
    @discardableResult
    static func configure(_ viewController: UserContactsViewController) -> UserContactsViewController {
        let view = UserContactsView()
        let interactor = UserContactsInteractor()
        let presenter = UserContactsPresenter()
        let router = UserContactsRouter()
        
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
