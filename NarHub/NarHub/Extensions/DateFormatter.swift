//
//  DateFormatter.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 01.02.24.
//

import Foundation

extension Date {
    func formatRenewalDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy" // Set the date format
        let formattedDate = dateFormatter.string(from: self) // Convert to String
        return formattedDate
}

    }
