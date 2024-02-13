//
//  Story.swift
//  NarHubNetworkKit
//
//  Created by Sevar Jafarli on 09.02.24.
//

import Foundation

public struct StoriesResponse: Decodable {
    public var list: [StoryResponse]?
}

public struct StoryResponse: Decodable {
    public var id: Int?
    public var title: String?
    public var url: String?
}
