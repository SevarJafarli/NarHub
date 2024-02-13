//
//  BalanceTransferAPI.swift
//  NarHubNetworkKit
//
//  Created by Sevar Jafarli on 06.02.24.
//

import Foundation
import Moya

public enum BalanceTransferAPI {
    case transferAmounts
    
}

extension BalanceTransferAPI: TargetType {
    public var sampleData: Data {
        return Data()
    }
    
    
    public var headers: [String : String]? {
        let dict = ["Content-Type": "application/json"]
        return dict
    }
    
    public var baseURL: URL {
        switch self {
        case .transferAmounts:
            return URL(string: "https://demo9468773.mockable.io")!
            
        }
    }
    
    public var path: String {
        switch self {
        case .transferAmounts:
            return "/balance-transfer"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .transferAmounts:
            return .get
        }
    }
    
    public var task: Task {
        switch self {
        case .transferAmounts:
            return .requestPlain
        }
    }
    
    
    
    public var validate: Bool {
        return true
    }
    
    public var validationType: ValidationType {
        return .customCodes([200, 201, 202, 204, 304, 400, 401, 403, 404, 406, 409])
    }
    
    
}

