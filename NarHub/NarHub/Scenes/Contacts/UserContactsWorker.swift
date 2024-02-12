//
//  UserContactsWorker.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 30.01.24.
//

import UIKit

protocol UserContactsWorkingLogic {
    func fetchContacts(completion: @escaping (UserContactsDictionary) -> Void)
}

final class UserContactsWorker: UserContactsWorkingLogic {
    private let contactsManager = ContactsManager()
    
    func fetchContacts(completion: @escaping (UserContactsDictionary) -> Void) {
      
        let model = contactsManager.fetchContacts()
        completion(model)
    }
}
