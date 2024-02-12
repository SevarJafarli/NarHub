//
//  FreeSMSService.swift
//  NarHubNetworkKit
//
//  Created by Sevar Jafarli on 08.02.24.
//

import Foundation
import Moya

public protocol FreeSMSServiceProtocol: BaseServiceProtocol {
    
    func getDailySMSLimitInfo(completion: @escaping (Result<DailySMSInfoResponse, WrongResponse>) -> ())
}

public class FreeSMSService: BaseService, FreeSMSServiceProtocol {
    
    private var provider: MoyaProvider<FreeSMSAPI>!
    
    override init() {
        super.init()
        
        #if DEBUG
        self.provider = MoyaProvider<FreeSMSAPI>()
        #else
        self.provider = MoyaProvider<LoyaltyAPI>(plugins: [self.authPlugin, self.languagePlugin])
        #endif
    }
    
   
 
    public func getDailySMSLimitInfo(completion: @escaping (Result<DailySMSInfoResponse, WrongResponse>) -> ()) {
        self.request(provider, target: .dailySMSLimit) { result in
    
            completion(result)
        }
    }
}
