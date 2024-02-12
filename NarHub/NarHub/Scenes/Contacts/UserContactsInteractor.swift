//
//  UserContactsInteractor.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 30.01.24.
//

import UIKit

protocol UserContactsBusinessLogic {
    
    func loadContacts(request: UserContacts.Load.Request)
}

protocol UserContactsDataStore {
    var phoneNumber: String { get set }
}

final class UserContactsInteractor: UserContactsBusinessLogic, UserContactsDataStore {
    var phoneNumber: String = ""
    
 
    var presenter: UserContactsPresentationLogic?
    lazy var worker: UserContactsWorkingLogic = UserContactsWorker()
    
    // MARK: Business Logic
  
    func loadContacts(request: UserContacts.Load.Request) {
        worker.fetchContacts { contactsDictionary in
            let response = UserContacts.Load.Response(model: contactsDictionary)
            self.presenter?.presentContacts(response: response)
        }
       
    }
}
