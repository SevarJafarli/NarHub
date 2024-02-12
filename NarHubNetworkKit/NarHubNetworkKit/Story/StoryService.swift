//
//  StoryService.swift
//  NarHubNetworkKit
//
//  Created by Sevar Jafarli on 09.02.24.
//


import Foundation
import Moya

public protocol StoryServiceProtocol: BaseServiceProtocol {
    
    func getStories(completion: @escaping (Result<StoriesResponse, WrongResponse>) -> ())
}

public class StoryService: BaseService, StoryServiceProtocol {
    
    private var provider: MoyaProvider<StoryAPI>!
    
    override init() {
        super.init()
        
        #if DEBUG
        self.provider = MoyaProvider<StoryAPI>()
        #else
        self.provider = MoyaProvider<LoyaltyAPI>(plugins: [self.authPlugin, self.languagePlugin])
        #endif
    }
    
   
 
    public func getStories(completion: @escaping (Result<StoriesResponse, WrongResponse>) -> ()) {
        self.request(provider, target: .stories) { result in
    
            completion(result)
        }
    }
}
