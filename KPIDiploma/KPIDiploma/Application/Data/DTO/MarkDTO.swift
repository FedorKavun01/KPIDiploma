//
//  MarkDTO.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 04.12.2022.
//

import Foundation

struct MarkDTO: Codable {
    public var id: String
    public var studentId: String
    public var name: String
    public var mark: Int
    public var teacher: String
}
