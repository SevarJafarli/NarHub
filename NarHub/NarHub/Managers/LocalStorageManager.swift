//
//  LocalStorageManager.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 31.01.24.
//

import Foundation

class LocalStorageManager {
    static let shared = LocalStorageManager()
    
    enum StorageKeys: String {
        case contactsPermission = "ContactsPermission"
    }
   
    func saveContactsPermissionValue(value: Bool) {
        UserDefaults.standard.set(value, forKey: StorageKeys.contactsPermission.rawValue)
    }
    func readContactsPermissionValue() -> Bool {
        return UserDefaults.standard.bool(forKey:  StorageKeys.contactsPermission.rawValue)
    }
}
