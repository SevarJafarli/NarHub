//
//  VASService.swift
//  NarHubNetworkKit
//
//  Created by Sevar Jafarli on 08.02.24.
//

import Foundation
import Moya

public protocol VASServiceProtocol: BaseServiceProtocol {
    
    func getVAS(completion: @escaping (Result<VASResponse, WrongResponse>) -> ())
}

public class VASService: BaseService, VASServiceProtocol {
    
    private var provider: MoyaProvider<VASAPI>!
    
    override init() {
        super.init()
        
        #if DEBUG
        self.provider = MoyaProvider<VASAPI>()
        #else
        self.provider = MoyaProvider<LoyaltyAPI>(plugins: [self.authPlugin, self.languagePlugin])
        #endif
    }
    
   
 
    public func getVAS(completion: @escaping (Result<VASResponse, WrongResponse>) -> ()) {
        self.request(provider, target: .vas) { result in
    
            completion(result)
        }
    }
}
