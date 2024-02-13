//
//  Result.swift
//  NarHubNetworkKit
//
//  Created by Sevar Jafarli on 06.02.24.
//

import Foundation


public enum Result<SuccessValue, WrongValue> {
    case successNoContent
    case success(SuccessValue)
    case wrong(WrongValue)
    case failure(Error)
}
