//
//  ContactsHelper.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 30.01.24.
//

import Foundation
import Contacts
import Contacts

final class ContactsManager {
    static let shared = ContactsManager()
    
    private let contactStore = CNContactStore()
    
    func requestPermissionToContacts(completion: @escaping () -> Void) {
        let isContactsPermissionGranted = LocalStorageManager.shared.readContactsPermissionValue()
        print("isContactsPermissionGranted \(isContactsPermissionGranted)")
        if(!isContactsPermissionGranted) {
            contactStore.requestAccess(for: .contacts)  { (granted, error) in
                LocalStorageManager.shared.saveContactsPermissionValue(value: granted)
                if granted {
                    completion()
                }
            }
        }
        else {
            completion()
        }
    }
    
    func fetchContacts() -> UserContactsDictionary {
        var dictionary = UserContactsDictionary(contactsDictionary: [:], sectionTitles: [])
        self.requestPermissionToContacts {
            let model = self.retrieveContacts()
            dictionary = model
            
        }
        return dictionary
    }
    
    private func retrieveContacts() -> UserContactsDictionary {
        let keysToFetch = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
        
        // Fetch all contacts with specified keys
        let request = CNContactFetchRequest(keysToFetch: keysToFetch as [CNKeyDescriptor])
        request.sortOrder = .givenName
        var contactsDictionary = [String: [UserContactModel]]()
        var sectionTitles = [String]()
        
        do {
            try self.contactStore.enumerateContacts(with: request, usingBlock: { (contact, stop) in
                
                let firstName = contact.givenName
                
                // Create a key using the first character of the first name
                let key = String(firstName.prefix(1)).uppercased()
                
                var phoneNumbers: [String] =  []
                for phoneNumber in contact.phoneNumbers {
                    let phoneNumberValue = phoneNumber.value.stringValue
                    phoneNumbers.append(phoneNumberValue)
    
                }
                if var contactsForKey = contactsDictionary[key] {
                    contactsForKey.append(UserContactModel(firstName: firstName, lastName: contact.familyName, phoneNumbers: phoneNumbers))
                        contactsDictionary[key] = contactsForKey
                    
                } else {
                    contactsDictionary[key] = [UserContactModel(firstName: firstName, lastName: contact.familyName, phoneNumbers: phoneNumbers)]
                }

                sectionTitles = contactsDictionary.keys.sorted()
            })
        }
        
        catch {
            // Handle errors
            print("Error fetching contacts: \(error)")
        }
        
        return UserContactsDictionary(contactsDictionary: contactsDictionary, sectionTitles: sectionTitles)
    }
    
}
