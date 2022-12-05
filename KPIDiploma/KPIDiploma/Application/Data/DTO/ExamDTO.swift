//
//  ExamDTO.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 29.11.2022.
//

import Foundation

struct ExamDTO: Codable {
    public var id: String
    public var groupId: String
    public var name: String
    public var startTime: Date
    public var endTime: Date
    public var teacher: String
    public var link: String?
}
