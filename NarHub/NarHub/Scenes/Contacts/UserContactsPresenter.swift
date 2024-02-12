//
//  UserContactsPresenter.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 30.01.24.
//

import UIKit

protocol UserContactsPresentationLogic {
    
    func presentContacts(response: UserContacts.Load.Response)
}

final class UserContactsPresenter: UserContactsPresentationLogic {    
    
    weak var viewController: UserContactsDisplayLogic?
  
    
    // MARK: Presentation
  
    func presentContacts(response: UserContacts.Load.Response) {
        let viewModel = UserContacts.Load.ViewModel(model: response.model)
        viewController?.displayContacts(viewModel: viewModel)

    }
}
