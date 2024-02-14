//
//  CacheManager.swift
//  NarHub
//
//  Created by Sevar Jafarli on 13.02.24.
//

import Foundation
import RealmSwift

public class CacheManager {
    
    public  static let shared = CacheManager()
    //TODO: generic
    
    public func saveData<T: Object>(data: T) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(data)
        }
    }
    
    public func readData<T: Object>() -> Results<T> {
        let realm = try! Realm()
        let data = realm.objects(T.self)
        return data
    }
}

