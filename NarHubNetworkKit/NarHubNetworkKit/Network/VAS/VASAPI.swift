//
//  VASAPI.swift
//  NarHubNetworkKit
//
//  Created by Sevar Jafarli on 08.02.24.
//



import Foundation
import Moya

public enum VASAPI {
    case vas
    
}

extension VASAPI: TargetType {
    public var sampleData: Data {
        return Data()
    }
    
    
    public var headers: [String : String]? {
        let dict = ["Content-Type": "application/json"]
        return dict
    }
    
    public var baseURL: URL {
        switch self {
        case .vas:
            return URL(string: "https://demo9468773.mockable.io")!
            
        }
    }
    
    public var path: String {
        switch self {
        case .vas:
            return "/vas"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .vas:
            return .get
        }
    }
    
    public var task: Task {
        switch self {
        case .vas:
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

