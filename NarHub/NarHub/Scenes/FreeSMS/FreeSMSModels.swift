//
//  FreeSMSModels.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 25.01.24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import NarHubNetworkKit

enum FreeSMS {
  // MARK: Use cases
  
  enum Load {
      struct Request { }
   
    struct Response {
        let dailySMSLimitInfo: DailySMSInfoResponse
    }
      
    struct ViewModel {
        let info: DailySMSInfoModel
    }
  }
}


struct DailySMSInfoModel {
    public var title: String
    public var desc: String
    public var smsCount: String
}
