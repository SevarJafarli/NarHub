//
//  Hub.swift
//  NarHubNetworkKit
//
//  Created by Sevar Jafarli on 08.02.24.
//

import Foundation

public struct HubResponse: Decodable {
    public var list: [Hub]?
    
    public init(list: [Hub]?) {
        self.list = list
    }
}

public struct Hub: Decodable {
    public var id: Int?
    public var title: String?
    
    public init(id: Int?, title: String?) {
        self.id = id
        self.title = title
    }
}
