//
//  FinanceDTO.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 04.12.2022.
//

import Foundation

struct FinanceDTO: Codable {
    public var id: String
    public var studentID: String
    public var isContract: Bool
    public var debtAmount: Int?
}
