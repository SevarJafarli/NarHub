//
//  PhoneNumberChecker.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 30.01.24.
//

import Foundation

extension String {
    ///check if first 2 chars of number string contains 70 or 77
    func checkPhoneNumber() -> Bool {
       return self.count == StringFormats.phoneNumber.rawValue.count &&
        (self.prefix(2) == "77" || self.prefix(2) == "70")

    }
}
