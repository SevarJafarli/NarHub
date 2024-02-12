//
//  DashboardConfigurator.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 23.01.24.
//


import UIKit

final class DashboardConfigurator {
    
    @discardableResult
    static func configure(_ viewController: DashboardViewController) -> DashboardViewController {
        let mainView = DashboardView()
        let interactor = DashboardInteractor()
        let presenter = DashboardPresenter()
        let router = DashboardRouter()

        viewController.mainView = mainView
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        
        router.viewController = viewController
        router.dataStore = interactor
        
        return viewController
    }
}
