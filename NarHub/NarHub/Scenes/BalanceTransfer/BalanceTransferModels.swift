//
//  BalanceTransferModels.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 26.01.24.
//

import UIKit
import NarHubNetworkKit

public enum BalanceTransfer {
    
    // MARK: Use cases
  
    enum Load {
        
        struct Request {
        }
        
        struct Response {
            let transferAmounts: BalanceTransferResponse
        }
        
        struct ViewModel {
            let amountList: [String]
        }
    }
}



