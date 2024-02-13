//
//  HubObjectModel.swift
//  NarHubNetworkKit
//
//  Created by Sevar Jafarli on 12.02.24.
//

import Foundation
import RealmSwift

public class HubObjectModel: Object {
   @Persisted var title: String = ""
   @Persisted var id: Int = 0

   public convenience init(title: String, id: Int) {
       self.init()
       self.title = title
       self.id = id
   }
}
