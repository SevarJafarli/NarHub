//
//  DateCalculator.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 01.02.24.
//

import Foundation

class DateCalculator {
    static let shared = DateCalculator()
    
    func calculateDaysBetweenTwoDates(start: Date, end: Date) -> Int {
        let currentCalendar = Calendar.current
        guard let start = currentCalendar.ordinality(of: .day, in: .era, for: start) else {
            return 0
        }
        guard let end = currentCalendar.ordinality(of: .day, in: .era, for: end) else {
            return 0
        }
        return end - start
    }
}
