//
//  Connectivity.swift
//  NarHubNetworkKit
//
//  Created by Sevar Jafarli on 06.02.24.
//

import Foundation
import Alamofire

final class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
