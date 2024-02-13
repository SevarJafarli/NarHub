//
//  HubService.swift
//  NarHubNetworkKit
//
//  Created by Sevar Jafarli on 08.02.24.
//

import Foundation
import Moya

public protocol HubServiceProtocol: BaseServiceProtocol {
    
    func getHubServices(completion: @escaping (Result<HubResponse, WrongResponse>) -> ())
}

public class HubService: BaseService, HubServiceProtocol {
    
    private var provider: MoyaProvider<HubAPI>!
    
    override init() {
        super.init()
        
        #if DEBUG
        self.provider = MoyaProvider<HubAPI>()
        #else
        self.provider = MoyaProvider<LoyaltyAPI>(plugins: [self.authPlugin, self.languagePlugin])
        #endif
    }
    
   
 
    public func getHubServices(completion: @escaping (Result<HubResponse, WrongResponse>) -> ()) {
        self.request(provider, target: .hubServices) { result in
    
            completion(result)
        }
    }
}
