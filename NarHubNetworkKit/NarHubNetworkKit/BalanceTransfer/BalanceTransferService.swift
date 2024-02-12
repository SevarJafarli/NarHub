//
//  BalanceTransferService.swift
//  NarHubNetworkKit
//
//  Created by Sevar Jafarli on 06.02.24.
//

//import Foundation
import Moya

public protocol BalanceTransferServiceProtocol: BaseServiceProtocol {
    
    func getTransferAmounts(completion: @escaping (Result<BalanceTransferResponse, WrongResponse>) -> ())
}

public class BalanceTransferService: BaseService, BalanceTransferServiceProtocol {
    
    private var provider: MoyaProvider<BalanceTransferAPI>!
    
    override init() {
        super.init()
        
        #if DEBUG
        self.provider = MoyaProvider<BalanceTransferAPI>()
        #else
        self.provider = MoyaProvider<LoyaltyAPI>(plugins: [self.authPlugin, self.languagePlugin])
        #endif
    }
    
   
 
    public func getTransferAmounts(completion: @escaping (Result<BalanceTransferResponse, WrongResponse>) -> ()) {
        self.request(provider, target: .transferAmounts) { result in
    
            completion(result)
        }
    }
}
