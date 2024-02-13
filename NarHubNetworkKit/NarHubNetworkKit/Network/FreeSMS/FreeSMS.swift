//
//  FreeSMSAPI.swift
//  NarHubNetworkKit
//
//  Created by Sevar Jafarli on 08.02.24.
//

import Foundation
//


public struct DailySMSInfoResponse: Decodable {
    public var info: DailySMSInfo?
}

public struct DailySMSInfo: Decodable {
    public var title: String?
    public var desc: String?
    public var smsCount: String?
}
