//
//  Finance.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 04.12.2022.
//

import Foundation

struct Finance {
    public var id: String
    public var studentId: String
    public var isContract: Bool
    public var debtAmount: Int?
    
    static let mockData: Self = .init(id: "", studentId: "", isContract: false)
}
