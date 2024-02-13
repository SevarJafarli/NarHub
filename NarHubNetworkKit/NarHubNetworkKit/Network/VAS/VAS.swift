//
//  VAS.swift
//  NarHubNetworkKit
//
//  Created by Sevar Jafarli on 08.02.24.
//

import Foundation



public struct VASResponse: Decodable {
    public var data: [VASCardResponse]?
}

public struct VASCardResponse: Decodable {
    public var title: String?
    public var desc: String?
    public var amountMonthly: String?
    public var isSwitch: Bool?
    public var amount: Double?
    public var renewal: String?
    public var renewalDate: String?
    public var nextRenewalDate: String?
    public var progressValue: Double?
    
}
