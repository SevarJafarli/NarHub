//
//  VASWorker.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 31.01.24.
//

import UIKit
import NarHubNetworkKit

protocol VASWorkingLogic {
    
    func fetchVAS(_ completion: @escaping (VASResponse?) -> Void)
}

final class VASWorker: VASWorkingLogic {
    private let service =  App.service

    func fetchVAS(_ completion: @escaping (NarHubNetworkKit.VASResponse?) -> Void) {
        service.vas.getVAS { result in
            switch result {
            case .success(let data):
                completion(data)
            default:
                completion(nil)
            }
            
        }
    }
}
