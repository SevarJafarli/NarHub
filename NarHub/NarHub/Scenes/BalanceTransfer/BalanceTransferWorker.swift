//
//  BalanceTransferWorker.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 26.01.24.
//

import UIKit
import Moya
import NarHubNetworkKit

protocol BalanceTransferWorkingLogic {
    func fetchTransferAmounts(_ completion: @escaping (BalanceTransferResponse?) -> Void)
}

final class BalanceTransferWorker: BalanceTransferWorkingLogic {
    
    private let service =  App.service
    
    func fetchTransferAmounts(_ completion: @escaping (BalanceTransferResponse?) -> Void) {
        service.balanceTransfer.getTransferAmounts { result in
            switch result {
            case .success(let data):
                completion(data)
            default:
                completion(nil)
            }
            
        }
    }
    
}

