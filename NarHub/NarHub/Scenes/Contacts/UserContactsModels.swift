//
//  UserContactsModels.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 30.01.24.
//

import UIKit

enum UserContacts {
    
    // MARK: Use cases
  
    enum Load {
        
        struct Request {
        }
        
        struct Response {
            let model: UserContactsDictionary
        }
        
        struct ViewModel {
            let model: UserContactsDictionary

        }
    }
}
struct UserContactsDictionary {
    let contactsDictionary : [String: [UserContactModel]]
    let sectionTitles: [String]
    
    init(contactsDictionary: [String : [UserContactModel]], sectionTitles: [String]) {
        self.contactsDictionary = contactsDictionary
        self.sectionTitles = sectionTitles
    }
   
}

struct UserContactModel {
    let firstName: String
    let lastName: String
    let phoneNumbers: [String]
}
