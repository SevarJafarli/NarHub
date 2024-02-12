//
//  VASModels.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 31.01.24.
//

import UIKit
import NarHubNetworkKit

enum VAS {
    
    // MARK: Use cases
  
    enum Load {
        
        struct Request {
        }
        
        struct Response {
            let vas: VASResponse
        }
        
        struct ViewModel {
            
            let vasModels: [VASCardModel]
        }
    }
}

struct VASCardModel {
    public var title: String
    public var desc: String
    public var amountMonthly: String
    public var isSwitch: Bool
    public var amount: Double
    public var renewal: String
    public var renewalDate: String
    public var nextRenewalDate: String
    public var progressValue: Double
}

//MARK: Extension on VASCardModel

extension VASCardModel {
    public var hasServiceFee: Bool {
        return self.amount != 0 && !self.amountMonthly.isEmpty
    }
    public var hasRenewalDate: Bool {
        return !self.renewal.isEmpty && !self.renewalDate.isEmpty && !self.nextRenewalDate.isEmpty
    }
}
