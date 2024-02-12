//
//  DoubleFormatter.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 26.01.24.
//

import Foundation

extension Double {
    func convertToTwoDecimalPlaces() -> String {
        let amountInFloat = Float(self)
        return String(format: "%.2f", amountInFloat)
    }
}
