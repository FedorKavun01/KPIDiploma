//
//  Date+Ext.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 29.10.2022.
//

import Foundation

extension Date {
    func getFormattedString(dateFormat: DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat.format
        
        return dateFormatter.string(from: self)
    }
}

enum DateFormat {
    case usual
    case days
    
    var format: String {
        switch self {
        case .usual:
            return "MMM dd, yyyy hh:mm"
        case .days:
            return "MMM dd, yyyy"
        }
    }
}
