//
//  String+Ext.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 20.12.2022.
//

import Foundation

extension String {
    func stringToDate(dateFormat: String = "yyyy-MM-dd'T'HH:mm:ss") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter.date(from: self)
    }
}
