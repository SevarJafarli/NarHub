//
//  VASViewController.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 31.01.24.
//

import UIKit

protocol VASDisplayLogic: AnyObject {
    
    func displayLoad(viewModel: VAS.Load.ViewModel)
    func displayVAS(viewModel: VAS.Load.ViewModel)
}

final class VASViewController: UIViewController {
    
    var mainView: VASView?
    var interactor: VASBusinessLogic?
    var router: (VASRoutingLogic & VASDataPassing)?
  
    
    // MARK: - Lifecycle Methods

    override func loadView() {
        super.loadView()
        
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showBackButton = true
        self.title = "Əlavə dəyər xidmətləri"
        self.load()
    }

  
    func load() {
        self.mainView?.startLoading()
        let request = VAS.Load.Request()
        interactor?.loadVAS(request: request)
    }
}

// MARK: - Display Logic

extension VASViewController: VASDisplayLogic {
    
    func displayLoad(viewModel: VAS.Load.ViewModel) {
    }
    
    func displayVAS(viewModel: VAS.Load.ViewModel) {
        self.mainView?.configure(with: viewModel.vasModels)
        self.mainView?.stopLoading()
    }
}
